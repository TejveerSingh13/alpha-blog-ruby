class ArticlesController < ApplicationController
    def index
      @articles = Article.all
    end
    
    def show
      @article = Article.find(params[:id])
    end

    def new
      @article = Article.new
    end

    def edit
      @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description)) #whitelisitng (telling rails what to expect) or strong paramters
        if @article.save
          flash[:notice] = "Article was created successsfully"
          redirect_to article_path(@article) #prefix_path(id)
        # same as
        # redirect_to @article #<- This here is a shorthand for the above redirect
        else
          render 'new'
        end
    end

    def update
      @article = Article.find(params[:id])
      if @article.update(params.require(:article).permit(:title, :description))
        flash[:notice] = "Article was updated successsfully"
          redirect_to article_path(@article) #prefix_path(id)
      else
        render 'edit'
      end
    end
end