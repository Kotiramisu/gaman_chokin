class Saving < ApplicationRecord
  
  belongs_to :user

  validates :title, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :saved_at, presence: true
end
