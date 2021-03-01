class Review < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  has_many :reports, dependent: :destroy
end
