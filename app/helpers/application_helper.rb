module ApplicationHelper

  def hidden_complete_iteration_form(action=nil)
    action ||= completed_session_path(@session, @step, @iteration)
    content_tag(:form, method: "POST", action: action, id: 'completeIteration') do
      hidden_field_tag 'stats'
    end
  end

end
