class Level < ActiveRecord::Base
  belongs_to :game

  attr_accessible :duration, :name, :order, :repetitions

  validates :game_id, :presence => true
  validates :order, :presence => true
  validates :duration, :presence => true
  validates :repetitions, :presence => true

  def generate_iteration(iteration=nil)
    # TODO: Fill with data required by level's game
    return {}
  end

  def view_name
    game.view_name
  end

end
