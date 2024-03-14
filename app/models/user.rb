class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :password, presence: true
  validates :email, presence: true
  validates :location, presence: true
  has_many :bookings
  has_many :books
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
