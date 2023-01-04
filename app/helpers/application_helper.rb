# frozen_string_literal: true

module ApplicationHelper
  # def formatted_date(date)
  #     d_date = if date.present?
  #                date.strftime('%A, %b %d, %Y') if date.present?
  #              else
  #                'N/A'
  #              end
  #     return d_date
  # end

  def flash_class(level)
    case level
    when :notice then 'alert alert-success'
    when :alert then 'alert alert-danger'
    end
  end
end
