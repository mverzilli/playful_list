class AssosiateCurrentListsToDemoUser < ActiveRecord::Migration
  def up
    user = User.create! :email => "demo@demo.com", :password => "demodemo"
    lists = List.where user_id: nil

    lists.each do |list|
      list.user_id = user.id
      list.save!
    end

  end

  def down
  end
end
