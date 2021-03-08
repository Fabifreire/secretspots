class Review < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  has_many :reports, dependent: :destroy
  has_many_attached :photos
  validates :description, presence: true
  validates :rating, inclusion: { in: 0..5 }, numericality: { only_integer: true }
end


