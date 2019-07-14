require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'associations' do
    it { should have_many(:book_histories).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:isbn) }
  end

  describe 'methods' do
    context 'borrow' do
      let(:book) { Book.create(title: "abc", description:"cba", isbn: "isbn")}

      it 'status was changed to unavailable' do
        book.borrow
        expect(book.status).to eq "unavailable"
      end
    end

    context 'return' do
      let(:book) { Book.create(title: "abc", description:"cba", isbn: "isbn", status: "unavailable")}

      it 'status was changed to available' do
        book.return
        expect(book.status).to eq "available"
      end
    end

    context 'is_borrowed?' do
      let(:book_unavailable) { Book.create(title: "abc", description:"cba", isbn: "isbn", status: "unavailable")}
      let(:book_available) { Book.create(title: "abc", description:"cba", isbn: "isbn", status: "available")}

      it 'must return true' do
        expect(book_unavailable.is_borrowed?).to eq true
      end

      it 'must return false' do
        expect(book_available.is_borrowed?).to eq false
      end
    end
  end
end
