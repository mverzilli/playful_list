class Level < ActiveRecord::Base
  belongs_to :list
  belongs_to :game

  attr_accessible :duration, :name, :order
  validates :game_id, :presence => true
  validates :order, :presence => true
  validates :duration, :presence => true



end
