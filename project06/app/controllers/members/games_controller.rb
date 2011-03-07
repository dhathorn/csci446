class Members::GamesController < Members::MembersController
  filter_resource_access
  def index
    @games = current_user.games.paginate :page => params[:page], :order => 'created_at DESC'
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(params[:game])
    @game.user = current_user
    if @game.save
     redirect_to(members_root_path, :notice => "successfully created #{@game.title}.")
    else
      flash[:error] = "Could not create game"
      render :action => "new"
    end
  end
  
  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(params[:game])
     redirect_to(members_root_path, :notice => "successfully updated #{@game.title}.")
    else
      flash[:error] = "Could not save changes"
      render :action => "edit" 
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to(members_games_url)
  end
end
