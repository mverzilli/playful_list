class Question < ActiveRecord::Base
  attr_accessible :question, :answer, :level_id

  belongs_to :question, :class_name => "Choice"
  belongs_to :answer, :class_name => "Choice"
end
