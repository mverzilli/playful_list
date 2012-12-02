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

  def completed_iteration!(opts={})
    step = opts[:step]
    iteration = opts[:iteration]
    stats = opts[:stats] || {completed: true}
    level = level_at_step(step)

    save_iteration_statistics(step, iteration, stats)

    # Advance iteration
    iteration += 1

    # Check we are within bounds
    if level.repetitions == iteration
      # We have completed a level, hooray!
      step += 1
      new_level = level_at_step(step)

      # If there is no new level, then we have completed the full list, double hooray!
      return {:list_completed => true} if new_level.nil?

      # Return info on level completed otherwise
      return {:level_completed => level, :step => step, :iteration => 0}
    else
      # Move to next iteration
      return {:step => step, :iteration => iteration}
    end

  end

  private

  def save_iteration_statistics(step, iteration, stats)
    (statistics[step] ||= {})[iteration] = stats
  end


end
