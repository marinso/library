require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:book_histories).dependent(:destroy) }

  context 'email_address validations' do
    it 'invalid' do
      user = User.create(password: "123456", password_confirmation:"123456")
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).not_to be_valid
      end
    end

    it 'valid' do
      user = User.create(password: "123456", password_confirmation:"123456")
      addresses = %w[user@foo.com user_at_foo@www.org example.user@foo.com foo+2@barbaz.com]
      addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end
  end

end
