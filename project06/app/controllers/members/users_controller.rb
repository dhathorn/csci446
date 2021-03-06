class Members::UsersController < Members::MembersController
  filter_resource_access
  before_filter :require_user, :except => [:new, :create]

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
