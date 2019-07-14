class BooksController < ApplicationController
  before_action :set_book, only: [:show]

  def index
    @books = Book.all.paginate(page: params[:page], per_page: 4)
  end

  def show
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :description, :author, :isbn, :status)
    end
end
