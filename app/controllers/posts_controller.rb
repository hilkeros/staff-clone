class PostsController < ApplicationController

	before_action :authenticate_user!

  def index
  	if current_user.admin
  		@posts = Post.all
  	else
  		@posts = current_user.group.try(:posts)
  	end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
  	@post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to posts_path
    else
      render 'edit'
    end
  end

	def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to posts_path, notice: 'Post deleted'
  end

  def post_params
      params.require(:post).permit(:title, :message, :group_id, :user_id, :visible, :track_reads, :picture)
  end

end
