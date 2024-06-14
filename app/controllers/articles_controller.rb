class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :update, :edit, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
      @articles = Article.all
    end
    
    def show
    end

    def new
      @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(white_list_article_param) #whitelisitng (telling rails what to expect) or strong paramters
        @article.user = current_user
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
      if @article.update(white_list_article_param)
        flash[:notice] = "Article was updated successsfully"
          redirect_to article_path(@article) #prefix_path(id)
      else
        render 'edit'
      end
    end

    def destroy
      @article.destroy                      # destroy the article
      redirect_to articles_path    # redirect to the article list
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    def white_list_article_param
      params.require(:article).permit(:title, :description)
    end

    def require_same_user
      if current_user != @article.user && !current_user.admin?
        flash[:alert] = "You can only edit/delete your own article"
        redirect_to @article
      end
    end
end