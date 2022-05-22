class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable

  enum role: { customer: 0, teacher: 1, admin: 2 }
end
