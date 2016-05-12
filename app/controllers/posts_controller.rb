class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: 'desc')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = 'Post has been created.'
      redirect_to posts_path
    else
      #something here
      flash.now[:alert] = 'Post has not been created.'
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
