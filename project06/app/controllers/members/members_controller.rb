class Member::MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def edit
    @member = current_user
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to(@member, :notice => 'Member was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @member = current_user
    if @member.update_attributes(params[:member])
      redirect_to(@member, :notice => 'Member was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to(members_url)
  end

end
