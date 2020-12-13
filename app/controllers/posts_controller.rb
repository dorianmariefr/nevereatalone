class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @post = Post.new
    @posts = Post.order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to posts_url
    else
      flash.now.alert = @post.full_error_messages
      redirect_to posts_url
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
