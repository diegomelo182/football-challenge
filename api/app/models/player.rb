class Player < ApplicationRecord
  belongs_to :nationality
  belongs_to :team

  has_many :subscriptions, dependent: :delete_all

  enum position: %w[G D M A]

  default_scope { limit(25) }
  scope :by_age, ->(age) { where('ROUND(DATEDIFF(Date(now()), birthdate)/365) = ?', age) }
  scope :by_position, ->(position) { where(position:) }
  scope :by_nationality, ->(nationality) { where(nationality_id: nationality) }
  scope :page, ->(page) { offset(page.to_i > 1 ? (page.to_i - 1) * 25 : 0).limit(25) }
end
