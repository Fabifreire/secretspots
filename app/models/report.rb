class Report < ApplicationRecord
  belongs_to :user
  belongs_to :review
  belongs_to :spot
  has_many :reported_users, through: :spots, source: :user, dependent: :destroy
  has_many :reported_reviews, through: :reviews, source: :user, dependent: :destroy
end
