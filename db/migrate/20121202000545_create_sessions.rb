class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.datetime :started_at
      t.text :statistics
      t.integer :user_id
      t.integer :list_id

      t.timestamps
    end
  end
end
