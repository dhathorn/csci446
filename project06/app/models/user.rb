class User < ActiveRecord::Base
  acts_as_authentic do |c|
    validates_length_of_login_field_options :minimum => 6
    c.merge_validates_length_of_password_confirmation_field_options :minimum => 6
  end

  has_attached_file :photo
  validates_presence_of :first_name, :last_name, :email
  belongs_to :role
  has_many :games
  before_create :add_member_role

  def admin?
    role_symbols.include?(:admin)
  end

  def long_name
    return "#{first_name} #{last_name}"
  end

  def same_name(current_member)
    if current_member && current_member.id == self.id
      return "me"
    else
      return long_name
    end
  end

  def role_symbols
    [role.name.downcase.to_sym]
  end

  def add_member_role
    self.role_id ||= Role.find_by_name("Member")
  end
end
