class Category < ApplicationRecord
  has_many :gym_classes

  validates :name, presence: true
end
