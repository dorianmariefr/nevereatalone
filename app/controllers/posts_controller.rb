class PostsController < ApplicationController
  skip_authorization_check

  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_back fallback_location: root_path
    else
      flash[:alert] = @post.full_error_messages
      redirect_to root_url
    end
  end


  protected
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end
