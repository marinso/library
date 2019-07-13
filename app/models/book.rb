class Book < ApplicationRecord
  has_many :book_histories, dependent: :destroy
  validates :title, :description, :isbn, presence: true

  scope :available, -> { where('status = ?', "available")}

  def is_borrowed?
    false
  end
end
