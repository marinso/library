class BookHistory < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :check_out_date, presence: true
end
