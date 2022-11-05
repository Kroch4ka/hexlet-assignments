class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post
      redirect_to @post
    else
      redirect_to posts_url, :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      redirect_to :posts
    end
  end

  def destroy
    redirect_to :posts if Post.delete(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :summary, :published)
  end
end
