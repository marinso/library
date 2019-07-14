class Book < ApplicationRecord
  has_one_attached :thumbnail
  has_many :book_histories, dependent: :destroy
  validates :title, :description, :isbn, presence: true

  validates :thumbnail, attached: true, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'], message: "allow only jpg, jpeg, png" }

  scope :available, -> { where('status = ?', "available")}

  def borrow
    self.status = "unavailable"
  end

  def return
    self.status = "available"
  end

  def is_borrowed?
    if self.status == "unavailable"
      return true
    else
      return false
    end
  end

  def resize
    return self.thumbnail.variant(resize: "100x100")
  end
end
