class Payment < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories, dependent: :destroy

  validates :name, presence: true
  validates :amount, numericality: true
end
