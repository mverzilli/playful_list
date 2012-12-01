class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    p 'entered index'
  end

end
