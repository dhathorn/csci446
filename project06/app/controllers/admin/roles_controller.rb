class Admin::RolesController < Admin::AdminController
  filter_resource_access
  
  def index
    @roles = Role.all
  end

  def new
    @users = User.all
    @role = Role.new
  end

  def edit
    @role = Role.find(params[:id])
    @users = User.all
  end

  def create
    @users = User.all
    @role = Role.new(params[:role])
    if @role.save
     redirect_to( admin_root_path, :notice => "Successfully added #{@role.name}")
    else
      flash[:error] = "Could not create role"
      render :action => "new"
    end
  end
  
  def update
    @users = User.all
    @role = Role.find(params[:id])

    if @role.update_attributes(params[:role])
      redirect_to( admin_root_path, :notice => 'role was successfully updated.')
    else
      render :action => "edit" 
    end
  end

end
