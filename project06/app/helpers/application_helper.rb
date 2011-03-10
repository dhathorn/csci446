# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def display_photo(user)
    if(user.photo.file?) then image_tag user.photo.url end
  end

end

