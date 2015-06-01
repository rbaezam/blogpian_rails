class PostsController < ApplicationController
  # before_action :authenticate_user!
  respond_to :html, :json

  caches_action :index, :show

  def index
    @posts = Post.all.desc(:created_at)
    respond_with(@posts)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.tags = @post.tags_string.split(',')
    if @post.save
      expire_action :action => :index
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :tags_string)
  end
end
