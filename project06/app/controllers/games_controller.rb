class GamesController < ApplicationController
  filter_resource_access

  def index
    @games = Game.paginate :page => params[:page], :order => 'created_at DESC'
  end

  def show
    @game = Game.find(params[:id])
  end

end
