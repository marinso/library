class BookHistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @book_histories = current_user.book_histories.paginate(page: params[:page], per_page: 4)
  end
end
