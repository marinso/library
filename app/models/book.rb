class Book < ApplicationRecord
  has_many :book_histories, dependent: :destroy
  validates :title, :description, :isbn, presence: true

  scope :available, -> { where('status = ?', "available")}

  def borrow
    self.status = "unavailable"
  end

  def return
    self.status = "available"
  end

  def is_borrowed?
    unless self.status == "available"
      return true
    end
  end
end
