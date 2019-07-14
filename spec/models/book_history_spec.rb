require 'rails_helper'

RSpec.describe BookHistory, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:book) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:book) }
    it { should validate_presence_of(:check_out_date) }
  end
end
