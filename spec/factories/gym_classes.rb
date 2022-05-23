FactoryBot.define do
  factory :gym_class do
    category
    name { "MyString" }
    description { "MyString" }
    teacher_name { "MyString" }
    start_time { "2022-05-23 10:59:34" }
    duration { 1 }
  end
end
