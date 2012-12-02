class SessionsController < ApplicationController

  # list/id/play/step/iteration/action

  before_filter :load_session, :except => :start
  before_filter :load_level,   :except => :start

  def start
    @session = Session.create started_at: DateTime.now, statistics: {}, list_id: params[:list_id], user: current_user
    redirect_to play_session_path(@session, 0, 0)
  end

  def play
    @data = @level.generate_iteration(@iteration)
    render "/home/#{@level.view_name}"
  end

  def completed
    @session.completed_level_iteration!(level: @level, iteration: @iteration, data: @data)
    @level.completed_iteration!(@iteration)
  end

  private

  def load_session
    @session = current_user.sessions.find(params[:id])
  end

  def load_level
    @step = params[:step]
    @iteration = params[:iteration]
    @level = @session.level_at_step(@step)
  end

end
