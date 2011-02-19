class ArticlesController < ApplicationController
  
	def index
    @total_articles = Article.all
		@articles = Article.paginate :page => params[:page], :order => 'created_at DESC'
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
		@authors = Author.all
  end

  def edit
    @article = Article.find(params[:id])
		@authors = Author.all
    session[:go_back] = request.env['HTTP_REFERER'] || articles_url
  end

  def create
    @article = Article.new(params[:article])
		@authors = Author.all
		if @article.save
			redirect_to(@article, :flash => {:success => 'Article was successfully created.'})
		else
			flash[:error] = 'Error creating article.'
			render :action => "new"
		end
  end

  def update
    @article = Article.find(params[:id])
		@authors = Author.all

		if @article.update_attributes(params[:article])
			redirect_to(session[:go_back], :flash => {:success => 'Article was successfully updated.'})
		else
			flash[:error] = 'Error updating article.'
			render :action => "edit"
		end

	end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
		redirect_to(articles_url)
  end
end
