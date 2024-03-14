class Book < ApplicationRecord
  has_one_attached :cover_image
  belongs_to :user
  validates :title, presence: true
  validates :genre, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :price, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_title_and_author,
    against: [ :title, :author ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
