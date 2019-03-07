class Product < ApplicationRecord
  before_save :set_default
  has_many :donates, dependent: :destroy

  scope :search, -> (code) { find_by code: code }

  private
  def set_default
    self.quantity ||= 0.5
  end
end
