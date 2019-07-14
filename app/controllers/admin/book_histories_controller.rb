class Admin::BookHistoriesController < ApplicationController
  before_action :set_book_history, only: [:destroy, :edit, :update]
  before_action :require_admin!

  def index
  @book_histories = BookHistory.all.paginate(page: params[:page], per_page: 4)
end

def show
end

def new
  @users = User.all
  @book_history = BookHistory.new
  @books = Book.available
end

def edit
  @users = User.all
  @books = User.all
end

def create
  @book_history = BookHistory.new(book_history_params)

  respond_to do |format|
    if @book_history.save
      @book_history.book.borrow
      @book_history.book.save
      format.html { redirect_to admin_book_histories_path, notice: 'Book history was successfully created.' }
    else
      format.html { redirect_to admin_book_histories_path }
    end
  end
end

def update
  respond_to do |format|
    if @book_history.update(book_history_params)
      format.html { redirect_to admin_book_histories_path, notice: 'Book history was successfully updated.' }
    else
      format.html { render :edit }
    end
  end
end

def destroy
  @book_history.destroy
  @book_history.book.return
  @book_history.book.save
  respond_to do |format|
    format.html { redirect_to admin_book_histories_path, notice: 'Book history was successfully destroyed.' }
  end
end

def return
  @book_history = BookHistory.find(params[:book_history_id])
  @book_history.book.return
  @book_history.check_in_date =  DateTime.now.strftime("%Y-%m-%d")
  respond_to do |format|
    if @book_history.book.save && @book_history.save
      flash.now[:notice] = 'Book was returned.'
      format.html { redirect_to admin_book_histories_path }
    end
  end
end

private
def set_book_history
  @book_history = BookHistory.find(params[:id])
end

def book_history_params
  params.require(:book_history).permit(:user_id, :book_id, :check_out_date, :check_in_date)
end
end

