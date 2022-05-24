class GymClassUserSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :gym_class
end
