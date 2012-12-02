class AddLevelColumnToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :level_id, :integer
  end
end
