class Admin::AdminController < ApplicationController
#  before_filter :require_user

  def index
    @games = Game.paginate :page => params[:page], :order => 'created_at DESC'
    render :template => 'members/index'
  end

  private

  def require_user
    unless current_user
      flash[:notice] = "You must log in!"
      redirect_to root_url
      return false
    end
  end
end
