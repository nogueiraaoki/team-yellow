class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.float :price
      t.integer :quantity
      t.string :kind
      t.string :photo_url

      t.timestamps
    end
  end
end
