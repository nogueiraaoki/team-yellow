class Donate < ApplicationRecord
  belongs_to :user
  belongs_to :act
end
