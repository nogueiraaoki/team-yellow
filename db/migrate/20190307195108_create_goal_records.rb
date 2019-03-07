class CreateGoalRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :goal_records do |t|
      t.string :name
      t.integer :quantity
      t.references :goal, foreign_key: true
      t.references :act, foreign_key: true

      t.timestamps
    end
  end
end
