class Admin::AdminController < ApplicationController
  before_filter :require_user

  def index
    @games = Game.paginate :page => params[:page], :order => 'created_at DESC'
    render :template => 'members/index'
  end

  protected 

  def permission_denied
    flash[:error] = "You don't have permission to do that"
    redirect_to members_root_url
  end

  private

  def require_user
    unless current_user
      flash[:error] = "You do not have permission Michael, go away! Get over it! It was 20 years ago!"
      redirect_to root_url
      return false
    end
  end


end
