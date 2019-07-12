class Book < ApplicationRecord
  has_many :book_histories
  validates :title, :description, :isbn, presence: true

  def is_borrowed?
    false
  end
end
