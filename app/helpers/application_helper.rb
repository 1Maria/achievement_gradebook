module ApplicationHelper

  def title
    base_title = "School Gradebook"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def display_achievements(achievements)
    result = ""
    achievements.each do |achievement|
      result << "<tr>"
      result << "<td>#{achievement.achievement_name}</td>"
      result << "<td>#{achievement.date}</td>"
      result << "<td>#{ achievement.score }</td>"
      result << "<td>#{ achievement.student_id}</td>"
      result << "</tr>"
    end
    result.html_safe
  end

end
