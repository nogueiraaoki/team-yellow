class CreateDonates < ActiveRecord::Migration[5.2]
  def change
    create_table :donates do |t|
      t.integer :quantity
      t.references :user, foreign_key: true
      t.references :act, foreign_key: true

      t.timestamps
    end
  end
end
