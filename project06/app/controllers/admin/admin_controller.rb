class Admin::AdminController < ApplicationController
  before_filter :require_member

  def index
    @games = Game.paginate :page => params[:page], :order => 'created_at DESC'
    render :template => 'games/index'
  end

  private

  def require_member
    unless current_member
      flash[:notice] = "You must log in!"
      redirect_to root_url
      return false
    end
  end
end
