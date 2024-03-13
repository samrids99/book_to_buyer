class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :date, presence: true
end
