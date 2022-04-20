class Payment < ApplicationRecord
  validates :name, presence: true
  validates :amount, numericality: true
end
