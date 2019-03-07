class Act < ApplicationRecord
  has_many :donates, dependent: :destroy
  has_many :goal_records, dependent: :destroy
end
