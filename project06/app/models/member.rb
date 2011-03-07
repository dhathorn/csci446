class Member < ActiveRecord::Base
  acts_as_authentic
  has_many :games

def tester
puts hi
end
  def same_name(current_member)
    if current_member && current_member.id == self.id
      return "me"
    else
      return "#{self.first_name} #{self.last_name}"
    end
  end
end
