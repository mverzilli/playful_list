class RemoveOrderFromListLevels < ActiveRecord::Migration
  def up
    remove_column :list_levels, :order
  end

  def down
    add_column :list_levels, :order, :integer
  end
end
