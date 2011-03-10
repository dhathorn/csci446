class Members::MembersController < ApplicationController
  before_filter :require_user

  protected

  def permission_denied
    flash[:error] = "Permission Denied"
    redirect_to members_root_url
  end

  private

  def require_user
    unless current_user
      flash[:error] = "You do not have permission"
      redirect_to root_url
      return false
    end
  end

end
