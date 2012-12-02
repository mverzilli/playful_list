class AddPositionToListLevel < ActiveRecord::Migration
  def change
    add_column :list_levels, :position, :integer
  end
end
