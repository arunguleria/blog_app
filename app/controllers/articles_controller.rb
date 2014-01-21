class ArticlesController < ApplicationController
  
  before_action :get_author
  before_action :check_login
  before_action :get_article, only: [:show, :edit, :update, :destroy]

  private
  
  def article_params
    params.require(:article).permit(:title, :body)
  end
  
  
  def get_author
    @author = Author.find(params[:author_id])
    access_denied unless @author
  end
  
  def get_article
    @article = Article.where(id: params[:id]).first
    if @article.nil?
      redirect_to author_articles_path, alert: "Sorry, we could not find this Artcile."
    end
  end
  
  public

  # GET - /articles
  def index
    @articles = @author.articles
  end
  
  # GET - /articles/1
  def show
  end
  
  # GET - /articles/new
  def new
    @article = Article.new
  end
  
  # POST - /articles
  def create  
    @article = Article.new(article_params)
    @article.author = @author
    
    if @article.save
      redirect_to author_article_url(@author, @article)
    else
      flash.now[:alert] = "Please correctly fill the form."
      render action: :new
    end
    
  end
  
  # GET - /articles/1/edit
  def edit
  end
  
  # PUT - /articles/1
  def update
    if @article.update_attributes(article_params)
      redirect_to author_article_url(@author, @article)
    else
      flash.now[:alert] = "Please correctly fill the form."
      render action: :edit
    end    
  end
  
  # DELETE - /articles/1
  def destroy
    @article.destroy
    redirect_to author_articles_path, notice: "Successfully deleted the requested Article."
  end

end


