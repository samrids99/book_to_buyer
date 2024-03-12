class Book < ApplicationRecord
  has_one_attached :cover_image
  belongs_to :user
  validates :title, presence: true
  validates :genre, presence: true
  validates :author, presence: true
  validates :description, presence: true
end
