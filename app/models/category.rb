class Category < ApplicationRecord
  has_many :gym_classes, dependent: :destroy

  validates :name, presence: true
end
