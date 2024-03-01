module ApplicationHelper
  # Determines the CSS class for a given flash message type
  def flash_class(type)
    case type
    when 'notice'
      'bg-green-500'  # Green background for notices
    when 'alert'
      'bg-red-500'    # Red background for alerts
    else
      'bg-blue-500'   # Blue background for other types
    end
  end
end
