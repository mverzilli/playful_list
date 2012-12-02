class AddLevelIdToSessionIters < ActiveRecord::Migration
  def change
    add_column :session_iters, :level_id, :integer
  end
end
