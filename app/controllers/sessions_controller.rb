class SessionsController < ApplicationController
  layout 'headless'

  before_filter :load_sessions, :only => [:index]
  before_filter :load_session,  :except => [:start, :index]
  before_filter :load_level,   :only => [:play, :completed, :too_many_attempts]
  before_filter :load_prize,   :only => [:finished_list, :finished_level]

  def index
  end

  def start
    @session = Session.create! started_at: DateTime.now, statistics: {}, list_id: params[:list_id], user: current_user
    redirect_to play_session_path(@session, step: 0, iteration: 0)
  end

  def play
    @body_css = 'full_width'
    @data = @level.generate_iteration(@iteration)
    render "/games/#{@level.view_name}"
  end

  def too_many_attempts
    stats = params[:stats_too_many] ? JSON.parse(params[:stats_too_many]) : {}

    p stats
    p @step
    p @iteration

    result = @session.too_many_attempts!(step: @step, iteration: @iteration, stats: stats)

    # Play another instance of the same level and iteration
    redirect_to play_session_path(@session, result[:step], result[:iteration])
  end

  def completed
    stats = params[:stats] ? JSON.parse(params[:stats]) : {}
    result = @session.completed_iteration!(step: @step, iteration: @iteration, stats: stats)

    if result[:list_completed]
      redirect_to finished_list_session_path(@session, from_step: result[:step]-1)
    elsif result[:level_completed]
      redirect_to finished_level_session_path(@session, from_step: result[:step]-1, next_step: result[:step])
    else
      redirect_to play_session_path(@session, result[:step], result[:iteration])
    end
  end

  def finished_list
  end

  def finished_level
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
    @prize_media_name = @session.reinforcement_for_step(params[:from_step].to_i)
    @total_number_of_levels = @session.list.levels.count
  end

  def load_sessions
    @sessions = if current_user
      current_user.sessions
    else
      Session.scoped
    end

    @sessions = @sessions.where(list_id: params[:list_id]) if params[:list_id]
  end


end
