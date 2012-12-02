class SessionIter < ActiveRecord::Base
  attr_accessible :iteration, :stats, :session_id, :step

  belongs_to :session

  # store :stats, accessors: [:started_at, :completed_at]
  serialize :stats, Hash
end
