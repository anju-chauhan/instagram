class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show 
  end

  def index
    @articles = Article.all
  end

  def new 
    @article = Article.new
  end

  def edit 
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
        flash[:notice] ="Article was created sucessfully"
    redirect_to (@article)
    else
        render 'new'
    end
   end


   def update
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
   end


   def destroy
     debugger
     @article.destroy
     redirect_to articles_path
   end


   private


def set_article
   @article = Article.find(params[:id])
end




end



