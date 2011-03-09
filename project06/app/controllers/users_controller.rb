class UsersController < ApplicationController
  filter_resource_access

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if verify_recaptcha(:model => @user) && @user.save
      redirect_to(members_root_path, :notice => "Welcome #{@user.long_name}")
    else
      flash[:error] = "Sorry, could not register you"
      render :action => "new"
    end
  end

end
