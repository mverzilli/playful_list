# DEPRECATED
# This controller and its views are deprecated
# Refer to sessions controller
class HomeController < ApplicationController
  def mating
    choices = ['circle.jpg', 'square.jpg', 'triangle.jpg']

    @choices_left = choices.shuffle
    @choices_right = choices.shuffle

    @question = choices.sample
    @answer = @question
  end

  def sequence
  end
end
