# DEPRECATED
# This controller and its views are deprecated
# Refer to sessions controller
class HomeController < ApplicationController
  def por_que
  end

  def sign_in_as_demo_user
    user = User.find_by_email 'demo@demo.com'
    sign_in(:user, user)
    redirect_to root_path
  end
end
