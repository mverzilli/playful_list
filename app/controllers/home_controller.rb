# DEPRECATED
# This controller and its views are deprecated
# Refer to sessions controller
class HomeController < ApplicationController
  def mating
    mating_instance = Game.all[0].levels[0].generate_iteration

    @choices_left = mating_instance.left_column_choices.map { |c| c.image }
    @choices_right = mating_instance.right_column_choices.map {|c| c.image }

    @question = mating_instance.question.image
    @answer = mating_instance.answer.image
  end

  def sequence
  end

  def sign_in_as_demo_user
    user = User.find_by_email 'demo@demo.com'
    sign_in(:user, user)
    redirect_to root_path

  end
end
