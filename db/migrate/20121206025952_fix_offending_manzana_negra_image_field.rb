class FixOffendingManzanaNegraImageField < ActiveRecord::Migration
  def up
    to_fix = Choice.where(:image => 'manzana negra.png').first
    to_fix.image = 'manzana-negra.png'
    to_fix.save
  end

  def down
    to_fix = Choice.where(:image => 'manzana-negra.png').first
    to_fix.image = 'manzana negra.png'
    to_fix.save
  end
end
