class Admin::UsersController < Admin::AdminController
  filter_resource_access
  
  def index
    @users = User.paginate :page => params[:page], :order => 'last_name DESC'
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    @roles = Role.all 
  end

  def create
    @user = User.new(params[:user])
    @roles = Role.all 
    @roles = Role.all 
    if @user.save
      redirect_to([:admin, @user], :notice => 'user was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(admin_root_path, :notice => 'user was successfully updated.')
    else
      flash[:error] = "Could not save profile"
      render :action => "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(users_url)
  end

end
