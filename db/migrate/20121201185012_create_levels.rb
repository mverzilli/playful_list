class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name
      t.integer :duration
      t.integer :order
      t.references :list
      t.references :game

      t.timestamps
    end
    add_index :levels, :list_id
    add_index :levels, :game_id

  end
end
