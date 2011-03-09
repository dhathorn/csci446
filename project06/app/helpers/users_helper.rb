module UsersHelper
  def time_ago(timewithzone)
    if(timewithzone) then
      if(timewithzone.day == (Time.now - 1.days).day)
        return "Yesterday"
      else
       return "#{time_ago_in_words(timewithzone)} ago"
      end
    else
    "never"
    end
  end
end 
