module QuestionsHelper

	def custom_error_message(questions, field)
    if questions.present? && questions.errors.messages[field].present?
      content_tag :span, "#{questions.errors.messages[field][0]}",
        :class => 'help-block', :style => "color:#B94A48"
    else
      ''
    end
  end

end
