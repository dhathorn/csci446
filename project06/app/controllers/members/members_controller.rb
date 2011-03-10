class Members::MembersController < ApplicationController

  protected

  def permission_denied
    flash[:error] = "You do not have permission"
    redirect_to root_url
  end

end
