class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :name
      t.datetime :end_at
      t.integer :quantity
      t.string :kind

      t.timestamps
    end
  end
end
