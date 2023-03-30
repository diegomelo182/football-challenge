class User < ApplicationRecord
  has_secure_password

  has_many :subscriptions, dependent: :delete_all

  enum role: %i[user admin]

  validates :email, uniqueness: true
end
