class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    session[:go_back] = request.env['HTTP_REFERER'] || articles_url
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])
    @article.edit_count = 0

		if @article.save
			format.html { redirect_to(@article, :flash => {:success => 'Article was successfully created.'}) }
			format.xml  { render :xml => @article, :status => :created, :location => @article }
		else
			flash[:error] = 'Error creating article.'
			render :action => "new"
		end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

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

		format.html { redirect_to(articles_url) }
		format.xml  { head :ok }
  end
end
