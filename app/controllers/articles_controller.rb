class ArticlesController < ApplicationController
  def index
    if params[:tag].present?
      @articles = Article.all.tagged_with(params[:tag])
    else
      @articles = Article.all
    end
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
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
      flash[:success] =  "Article was successfully created."
    else
      render 'new'
      flash[:danger] = @article.errors.full_messages.join(", ")
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
      flash[:success] =  "Article was successfully updated."
    else
      render 'edit'
      flash[:danger] = @article.errors.full_messages.join(", ")
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:name, :title, :content, :tag_list, :banner_image_url)
    end

end
