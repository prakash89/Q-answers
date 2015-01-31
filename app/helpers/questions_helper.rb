module QuestionsHelper
def custom_error_message(resource, field)
    if resource.present? && resource.errors.messages[field].present?
        content_tag :span, "#{resource.errors.messages[field][0]}",
        :class => 'help-block', :style => "color:#B94A48"
    else
      ''
    end
end

end
