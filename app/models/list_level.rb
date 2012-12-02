class ListLevel < ActiveRecord::Base
  attr_accessible :level_id, :list_id

  acts_as_list

  belongs_to :level
  belongs_to :list
end
