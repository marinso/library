class BookHistory < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user, :book, :check_out_date, presence: true

  # scope :not_returned, -> (bool) { where(check_in_date: "#{bool}") }
  scope :user, -> (user_id) { where(user_id: user_id) }

end
