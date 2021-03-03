class Spot < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many_attached :photos
  validates :category, inclusion: { in: %w(monument mirador panoramic beach bay cliff),
    message: "%{value} is not a valid category" }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
