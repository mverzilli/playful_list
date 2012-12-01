class Game < ActiveRecord::Base
  attr_accessible :name
  has_many :levels

  validates :name, :presence => true

end
