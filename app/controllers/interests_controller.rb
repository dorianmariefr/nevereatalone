class InterestsController < ApplicationController
  load_and_authorize_resource find_by: :slug

  def show
    @users = User.joins(:interests).where(interests: { content: @interest.content })
  end

  def create
    @interests = interest_params[:content].to_s.split(",").map do |content|
      Interest.new(user: current_user, content: content)
    end

    if @interests.all?(&:save)
      redirect_to current_user
    else
      redirect_to current_user, alert: @interests.map(&:full_error_messages).to_sentence
    end
  end

  def destroy
    @interest.destroy!

    redirect_to current_user
  end

  private

  def interest_params
    params.require(:interest).permit(:content)
  end
end
