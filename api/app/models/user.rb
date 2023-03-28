class User < ApplicationRecord
  has_secure_password

  enum role: %i[user admin]

  validates :email, uniqueness: true
end
