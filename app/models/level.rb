class Level < ActiveRecord::Base
  belongs_to :game

  has_many :questions

  attr_accessible :duration, :name, :order, :repetitions

  validates :game_id, :presence => true
  validates :order, :presence => true
  validates :duration, :presence => true
  validates :repetitions, :presence => true

  def generate_iteration(iteration=nil)
    return GameInstanceFactory.create_from self
  end

  def view_name
    game.view_name
  end
end
