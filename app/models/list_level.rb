class ListLevel < ActiveRecord::Base
  attr_accessible :level_id, :list_id, :order

  belongs_to :level
  belongs_to :list
end
