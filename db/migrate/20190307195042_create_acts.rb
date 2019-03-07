class CreateActs < ActiveRecord::Migration[5.2]
  def change
    create_table :acts do |t|
      t.string :name
      t.text :note

      t.timestamps
    end
  end
end
