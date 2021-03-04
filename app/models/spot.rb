class Spot < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many_attached :photos
  has_many :reviewed_spots, through: :reviews, source: :user, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :category, inclusion: { in: %w(monument mirador panoramic beach bay cliff),
    message: "%{value} is not a valid category" }
end
