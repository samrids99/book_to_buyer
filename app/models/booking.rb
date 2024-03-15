class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :date, presence: true
  validates :status, inclusion: { in: %w(accept decline pending),
    message: "%{value} is not valid " }
end
