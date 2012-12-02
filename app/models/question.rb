class Question < ActiveRecord::Base
  belongs_to :question, :class_name => "Choice"
  belongs_to :answer, :class_name => "Choice"
end
