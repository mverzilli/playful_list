class Choice < ActiveRecord::Base
  attr_accessible :image
  attr_accessible :group

  has_many :questions
end
