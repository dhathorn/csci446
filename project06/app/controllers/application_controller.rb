
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :current_member, :current_member_session, :member_name
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  private

  def current_member_session
    return @current_member_session if defined?(@current_member_session)
    @current_member_session = MemberSession.find
  end

  def current_member 
    return @current_member if defined?(@current_member)
    @current_member = current_member_session && current_member_session.record
  end

end
