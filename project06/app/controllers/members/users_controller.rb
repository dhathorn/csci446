class Members::UsersController < Members::MembersController
  filter_resource_access

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = User.find(current_user)
    if @user.update_attributes(params[:user])
      redirect_to([:members, @user], :notice => 'user was successfully updated.')
    else
      render :action => "edit"
    end
  end

end
