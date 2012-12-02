class RemoveListIdFromLevels < ActiveRecord::Migration
  def up
    remove_column :levels, :list_id
  end

  def down
    add_column :levels, :list_id, :integer
  end
end
