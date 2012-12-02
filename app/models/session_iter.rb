class SessionIter < ActiveRecord::Base
  attr_accessible :iteration, :stats, :session_id, :step, :level_id

  belongs_to :session
  belongs_to :level

  serialize :stats, Hash

  def duration
    ((DateTime.parse(stats['completed_at']) - DateTime.parse(stats['started_at']))  * 24 * 60 * 60).to_i rescue nil
  end

  def attempts
    stats['attempts'].to_i rescue nil
  end

  def hints
    stats['hints'].to_i rescue nil
  end

end
