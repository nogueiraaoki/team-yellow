class Donate < ApplicationRecord
  belongs_to :user
  belongs_to :act
  belongs_to :product

  validates :quantity, presence: true
end
