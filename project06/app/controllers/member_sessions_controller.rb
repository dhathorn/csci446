class MemberSessionsController < ApplicationController
  def new
    @member_session = MemberSession.new
  end

  def create
    @member_session = MemberSession.new(params[:member_session])
    if @member_session.save
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def destroy
    @member_session = MemberSession.find
    @member_session.destroy
    redirect_to root_url
  end

end
