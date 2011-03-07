class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :current_user, :current_user_session, :user_name
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter { |c| Authorization.current_user = c.current_user }

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user 
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

end
