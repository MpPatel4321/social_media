# frozen_string_literal: true

module CommentsHelper
  def comment_time(date)
    time = (Time.now - date)
    if time > 432_000
      date.strftime('%d %B %Y').to_s
    elsif time > 86_400
      days = (((time / 60) / 60) / 24).to_i
      "#{days} day#{'s' if days > 1} ago"
    elsif time > 3600
      hours = ((time / 60) / 60).to_i
      "#{hours} hour#{'s' if hours > 1} ago"
    elsif time > 60
      minutes = (time / 60).to_i
      "#{minutes} minute#{'s' if minutes > 1} ago"
    else
      "#{time.to_i} second ago"
    end
  end
end
