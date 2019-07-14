require 'rails_helper'
RSpec.describe Admin::BookHistoriesController, type: :controller do

  describe '#POST return' do
    let!(:book) { Book.create(title: "abc", description:"cba", author:"daw", isbn: 'isbn', status: "unavailable") }
    let!(:user) { User.create(email: "abc@wp.pl", password:"123456", password_confirmation:"123456", role:"admin") }
    let!(:book_history) { BookHistory.create(user: user, book: book, check_out_date: "2019-07-12")}

    before(:each) do
      user.save!
      book.save(validate: false)
      book_history.save!
      allow(controller).to receive(:current_user).and_return(user)
    end
    xit 'book must change status to available' do
      post :return, params: { book_history_id: book_history.id }
      expect(book.status).to eq "available"
    end

    xit 'book history have new check_in_date' do
      post :return, params: { book_history_id: book_history.id }
      expect(book_history.check_out_date).to eq DateTime.now.strftime("%Y-%m-%d")
    end
  end
end
