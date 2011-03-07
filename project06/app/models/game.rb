class Game < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  belongs_to :user 
  validates_presence_of :title

  def rating_text
    if !rating
      "Unrated"
    elsif rating >= 3
      "Amazing"
    elsif rating == 2
      "Good"
    elsif rating == 1
      "Meh"
    else
      "Bad!"
    end
  end
end
