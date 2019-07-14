require 'rails_helper'
RSpec.describe BooksController, type: :controller do

  describe "GET #index" do
    it "returns a success response" do
      book = Book.create(title: "abc", description:"cba", isbn: 'isbn', status: "available")
      book.save(validate: false)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      book = Book.create(title: "abc", description:"cba", isbn: 'isbn', status: "available")
      book.save(validate: false)
      get :show, params: { id: book.id }
      expect(response).to be_successful
    end
  end
end
