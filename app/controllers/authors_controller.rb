class AuthorsController < ApplicationController
  
  before_action :check_login
  before_action :get_author, only: [:show, :update, :destroy, :edit]
  private
  
  def author_params
    params.require(:author).permit(:first_name, :last_name, :email)
  end
  
  def get_author
    @author = Author.where(id: params[:id]).first
    if @author.nil?
      redirect_to authors_path, alert: "sorry we could not find this author"
    end
  end
  
  public
  
  def index
    @authors = Author.all
  end
  
  def show 
  end
  
  def edit
  end
  
  def new
    @author = Author.new
  end
  def create
    @author = Author.new(author_params)
    
    if @author.save
      redirect_to author_url(@author)
    else
      flash.now[:alert] = "Please correctly fill the form"
      render action: :new
    end
  end
  def update
    if @author.update_attributes(author_params)
      redirect_to author_url(@author), notice: "Successfully updated Author."
    else
      flash.now[:alert] = "Please correctly fill the form"
      render action: :edit
    end
  end
  def destroy
    @author.destroy
    redirect_to authors_path, notice: "Successfully deleted the author"
  end

end
