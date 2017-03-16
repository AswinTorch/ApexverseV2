class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:tag].present?
      @posts = Post.all.tagged_with(params[:tag])
    else
      @posts = Post.all.order("created_at DESC")
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
      flash[:success] =  "Post was successfully created."
    else
      render 'new'
      flash[:danger] = @post.errors.full_messages.join(", ")
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
      flash[:success] =  "Post was successfully updated."
    else
      render 'edit'
      flash[:danger] = @post.errors.full_messages.join(", ")
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:name, :title, :content, :tag_list, :banner_image_url)
    end

end
