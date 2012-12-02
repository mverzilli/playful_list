class Session < ActiveRecord::Base
  attr_accessible :started_at, :statistics, :list_id, :user_id
  belongs_to :user
  belongs_to :list

  validates_presence_of :list
  validates_presence_of :user

  serializes :statistics, Hash

  def level_at_step(step)
    self.list.levels[step]
  end

  def completed_level_iteration!(opts={})
    level = opts[:level]
    iteration = opts[:iteration]
    data = opts[:data]

    statistics[level.id][iteration] = data
  end
end
