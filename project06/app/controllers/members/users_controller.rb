class Members::UsersController < Members::MembersController
  filter_resource_access

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = User.find(current_user)
    if @user.update_attributes(params[:user])
      redirect_to(members_root_path, :notice => 'successfully updated profile.')
    else
      flash[:error] = "Could not save profile"
      render :action => "edit"
    end
  end

end
