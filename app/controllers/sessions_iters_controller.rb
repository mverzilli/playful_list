class SessionsItersController < ApplicationController
  before_filter :load_session

  def index
    @iters_by_level = @session.session_iters.all.group_by(&:step).map do |step_number, iters|
      [iters.first.level, iters]
    end
  end

  private

  def load_session
    @session = if current_user
      current_user.sessions.find(params[:session_id])
    else
      Session.find(params[:session_id])
    end
  end


end
