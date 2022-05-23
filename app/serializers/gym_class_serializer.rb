class GymClassSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :teacher_name, :start_time, :duration, :category_id
end
