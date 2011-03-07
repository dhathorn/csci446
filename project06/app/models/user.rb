class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :role
  has_many :games

  def same_name(current_member)
    if current_member && current_member.id == self.id
      return "me"
    else
      return "#{self.first_name} #{self.last_name}"
    end
  end
end
