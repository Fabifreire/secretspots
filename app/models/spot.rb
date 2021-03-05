class Spot < ApplicationRecord
  CATEGORIES = %w[monument mirador panoramic beach bay cliff]
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many_attached :photos
  validates :category, inclusion: { in: CATEGORIES,
    message: "%{value} is not a valid category" }
  has_many :reviewed_spots, through: :reviews, source: :user, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
