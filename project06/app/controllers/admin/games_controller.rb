class Admin::GamesController < Admin::AdminController
  def index
    @games = Game.paginate :page => params[:page], :order => 'created_at DESC'
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
    @game.user_id = current_user
    if @game.save
     redirect_to([:admin, @game], :notice => 'Game was successfully created.')
    else
      render :action => "new"
    end
  end
  
  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(params[:game])
      redirect_to([:admin, @game], :notice => 'Game was successfully updated.')
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
