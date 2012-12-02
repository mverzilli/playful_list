class CreateChoiceTable < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :image

      t.string :group

      t.timestamps
    end
  end
end
