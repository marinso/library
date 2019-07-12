class Admin::BookHistoriesController < ApplicationController
  before_action :set_book_history, only: [:create, :destroy, :edit]

def index
  @book_histories = BookHistory.all
end

def new
  @book_history = BookHistory.new
end

def edit
end

def create
  @book_history = BookHistory.new(book_history_params)

  respond_to do |format|
    if @book_history.save
      format.html { redirect_to admin_book_histories(@book_history), notice: 'Book history was successfully created.' }
    else
      format.html { render :new }
    end
  end
end

def update
  respond_to do |format|
    if @book_history.update(book_history_params)
      format.html { redirect_to admin_book_histories(@book_history), notice: 'Book history was successfully updated.' }
    else
      format.html { render :edit }
    end
  end
end

def destroy
  @book_history.destroy
  respond_to do |format|
    format.html { redirect_to admin_book_histories, notice: 'Book history was successfully destroyed.' }
  end
end

private
def set_book_history
  @book_history = BookHistory.find(params[:id])
end

def book_history_params
  params.require(:book_history).permit(:belongs_to, :belongs_to, :check_out_date, :check_in_date)
end
end

