class ArticlesController < ApplicationController
    def index
      @articles = Article.all
    end
    
    def show
      @article = Article.find(params[:id])
    end

    def new
      
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description)) #whitelisitng (telling rails what to expect) or strong paramters
        @article.save
        redirect_to article_path(@article) #prefix_path(id)
        # same as
        # redirect_to @article #<- This here is a shorthand for the above redirect
    end
end