class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to([:members, @user], :notice => 'user was successfully created.')
    else
      render :action => "new"
    end
  end

end
