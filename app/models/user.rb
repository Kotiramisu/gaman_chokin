class User < ApplicationRecord
  has_secure_password

  has_many :savings, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :goal_amount, numericality: { greater_than_or_equal_to: 1 }, allow_nil: true
end
