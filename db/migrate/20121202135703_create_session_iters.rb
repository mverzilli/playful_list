class CreateSessionIters < ActiveRecord::Migration
  def change
    create_table :session_iters do |t|
      t.integer :session_id
      t.integer :step
      t.integer :iteration
      t.text :stats

      t.timestamps
    end
  end
end
