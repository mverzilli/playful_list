module ApplicationHelper

  def hidden_complete_iteration_form(action=nil)
    action ||= completed_session_path(@session, @step, @iteration)
    form_tag(action, id: 'completeIteration', method: "POST") do
      hidden_field_tag 'stats'
    end
  end
  
  def game_title(text)
    render 'shared/game_title', :text => text
  end

  def hidden_too_many_attempts_iteration_form(action=nil)
    too_many_attempts_session_path(@session, @step, @iteration)
    action ||= too_many_attempts_session_path(@session, @step, @iteration)
    form_tag(action, id: 'tooManyAttempts', method: "POST") do
      hidden_field_tag 'stats_too_many'
    end
  end

end
