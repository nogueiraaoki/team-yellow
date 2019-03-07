class AddProductToDonate < ActiveRecord::Migration[5.2]
  def change
    add_reference :donates, :product, foreign_key: true
  end
end
