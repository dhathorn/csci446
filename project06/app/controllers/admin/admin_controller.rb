class Admin::AdminController < ApplicationController
  before_filter :require_member

  def index
    @games = Game.paginate :page => params[:page], :order => 'created_at DESC'
    render :template => 'games/index'
  end

  private

  def require_member
    @current_user
  end
end
