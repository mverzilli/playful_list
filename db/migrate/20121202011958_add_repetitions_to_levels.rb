class AddRepetitionsToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :repetitions, :integer
  end
end
