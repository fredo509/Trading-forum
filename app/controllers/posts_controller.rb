class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :likes)
    render json: @posts, status: :ok
  end
  def show
    @post = Post.find(params[:id])
    render json: @post, status: :ok
  end
  def new
    @post = Post.new
  end
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      render json: @post, status: :created
      redirect_to user_path(id: @post.author_id), notice: 'Post was successfully created.'
    else
      render json: {errors: @post.errors.full_messages}, status: :unprocessable_entity
      flash.now[:alert] = 'An error has occurred while creating the post.'
      render :new
    end
  end
   def destroy
    @post = Post.find(params[:id])
    @author = @post.author
    @author.decrement!(:posts_counter)
    @post.destroy!
    redirect_to user_posts_path(id: @author.id), notice: 'Post was deleted successfully!'
  end
  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end