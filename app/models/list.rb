class List < ActiveRecord::Base
  attr_accessible :name

  has_many :list_levels
  has_many :levels, :through => :list_levels

  validates :name, :presence => true

end
