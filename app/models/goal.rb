class Goal < ApplicationRecord
  has_many :goal_records, dependent: :destroy
end
