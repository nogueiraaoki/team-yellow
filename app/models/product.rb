class Product < ApplicationRecord
  before_save :set_default
  has_many :donates, dependent: :destroy

  private
  def set_default
    self.quantity ||= 0.5
  end
end
