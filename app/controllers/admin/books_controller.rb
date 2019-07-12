class Admin::BooksController < ApplicationController

  # before_action :require_admin!
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to admin_book_path(@book.id), notice: 'Book was successfully created.' }
      else
        format.html { render 'admin/books/edit' }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to admin_book_path(@book.id), notice: 'Book was successfully updated.' }
      else
        format.html { render 'admin/books/edit' }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to admin_books_path, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :description, :author, :isbn, :status)
    end

    def require_admin!
      unless current_user and current_user.role == 'admin'
        redirect_to root_path, danger: "You don't belong there."
      end
    end

end
