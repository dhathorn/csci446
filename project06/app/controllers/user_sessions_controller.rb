class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Welcome back #{@user_session.record.long_name}"
      if @user_session.record.admin?
        redirect_to admin_root_url
      else
        redirect_to members_root_url
      end
    else
      flash[:error] = "Could not log in"
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to root_url
  end

end
