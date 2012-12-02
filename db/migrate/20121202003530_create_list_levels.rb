class CreateListLevels < ActiveRecord::Migration
  def change
    create_table :list_levels do |t|
      t.integer :list_id
      t.integer :level_id
      t.integer :order

      t.timestamps
    end
  end
end
