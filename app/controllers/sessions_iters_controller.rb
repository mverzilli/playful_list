class SessionsItersController < ApplicationController

  before_filter :load_session
  before_filter :load_level,   :only => [:play, :completed]
  before_filter :load_prize,   :only => [:finished_session, :finished_level]

  def index
  end

  private

  def load_session
    @session = if current_user
      current_user.sessions.find(params[:id])
    else
      Session.find(params[:id])
    end
  end

  def load_level
    @step = params[:step].to_i
    @iteration = params[:iteration].to_i || 0
    @level = @session.level_at_step(@step)
  end

  def load_prize
    @step = params[:next_step].to_i
    @iteration = 0
    @prize = @session.reinforcement_for_step(params[:from_step].to_i)
  end

end
