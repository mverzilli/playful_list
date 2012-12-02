class AddVideoColumnToListTable < ActiveRecord::Migration
  def change
    add_column :lists, :video, :string
  end
end
