class Session < ActiveRecord::Base
  attr_accessible :started_at, :statistics, :list_id, :list, :user_id, :user

  belongs_to :user
  belongs_to :list

  has_many :session_iters, dependent: :destroy

  validates_presence_of :list

  serialize :statistics, Hash

  def duration
    session_iters.map(&:duration).sum
  end

  def level_at_step(step)
    self.list.levels[step]
  end

  def too_many_attempts!(opts={})
    step = opts[:step]
    iteration = opts[:iteration]
    stats = opts[:stats] || {completed: true}
    level = level_at_step(step)

    save_iteration_statistics(level.id, step, iteration, stats)

    #Replay the same iteration and level
    return {:step => step, :iteration => iteration}
  end

  def completed_iteration!(opts={})
    step = opts[:step]
    iteration = opts[:iteration]
    stats = opts[:stats] || {completed: true}
    level = level_at_step(step)

    save_iteration_statistics(level.id, step, iteration, stats)

    # Advance iteration
    iteration += 1

    # Check we are within bounds
    if level.repetitions == iteration
      # We have completed a level, hooray!
      step += 1
      new_level = level_at_step(step)

      # If there is no new level, then we have completed the full list, double hooray!
      return {:level_completed => level, :step => step, :list_completed => true} if new_level.nil?

      # Return info on level completed otherwise
      return {:level_completed => level, :step => step, :iteration => 0}
    else
      # Move to next iteration
      return {:step => step, :iteration => iteration}
    end

  end

  def reinforcement_for_step(step)
    list.video
  end

  private

  def save_iteration_statistics(level_id, step, iteration, stats)
    session_iters.create(level_id: level_id, step: step, iteration: iteration, stats: stats)
  end


end
