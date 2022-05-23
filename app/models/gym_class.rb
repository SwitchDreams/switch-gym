class GymClass < ApplicationRecord
  # Duration is in seconds
  belongs_to :category

  validates :name, presence: true
end
