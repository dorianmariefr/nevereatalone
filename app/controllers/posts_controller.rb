class PostsController < ApplicationController
  skip_authorization_check

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:sucess] = "merci pour la recette ;)"
      redirect_back fallback_location: root_path
    else
      flash[:alert] = @post.errors_to_sentence
      redirect_to root_url
    end
  end


  protected
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end
