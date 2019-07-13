class BookHistoriesController < ApplicationController
  def index
    @book_histories = current_user.book_histories
  end
end
