FactoryBot.define do
  factory :user do
    email { "teste@email.com" }
    password { "1234" }
    role { 0 }
  end
end
