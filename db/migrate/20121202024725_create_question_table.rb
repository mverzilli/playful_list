class CreateQuestionTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :question

      t.integer :answer

      t.timestamps
    end
  end
end
