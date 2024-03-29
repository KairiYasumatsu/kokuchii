class LikesController < ApplicationController
  def create
    @like = Like.new
    @like = current_user.likes.create(post_id: params[:post_id])
    redirect_back(fallback_location: posts_path)
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: posts_path)
  end
end
