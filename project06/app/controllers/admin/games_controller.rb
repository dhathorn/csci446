class Admin::GamesController < Admin::AdminController
  filter_resource_access
  
  def index
    @games = Game.paginate :page => params[:page], :order => 'created_at DESC'
  end

  def new
    @users = User.all
    @game = Game.new
  end

  def edit
    @game = Game.find(params[:id])
    @users = User.all
  end

  def create
    @users = User.all
    @game = Game.new(params[:game])
    if @game.save
     redirect_to( admin_root_path, :notice => "Successfully added #{@game.title}")
    else
      flash[:error] = "Could not create game"
      render :action => "new"
    end
  end
  
  def update
    @users = User.all
    @game = Game.find(params[:id])

    if @game.update_attributes(params[:game])
      redirect_to( admin_root_path, :notice => 'Game was successfully updated.')
    else
      render :action => "edit" 
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to(members_games_url)
  end
end
