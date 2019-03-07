class GoalRecord < ApplicationRecord
  belongs_to :goal
  belongs_to :act
end
