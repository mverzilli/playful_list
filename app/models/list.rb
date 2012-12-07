class List < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :video

  belongs_to :user

  has_many :list_levels, :order => "position ASC"

  has_many :levels, :through => :list_levels

  validates :name, :presence => true

end
