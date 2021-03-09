class LikesController < ApplicationController
  before_action :set_user, :set_spot, :set_review
  def create
    @like = Like.create(user: @user, review: @review)
    @review_likes = @review.likes
    @total_likes = @review_likes.count
    @user_likes = @user.likes
    # redirect_back(fallback_location: root_path)
    # redirect_to spot_path(@review.spot, anchor: @review.id)
  end

  def destroy
    # @favorites = @user.favorites.order(created_at: :desc)
    @user_like = Like.find_by(user: @user, review: @review)
    @user_like.destroy
    # redirect_to spot_path(@review.spot, anchor: @review.id)
  end


  private 
  
  def set_user
    @user = current_user
  end

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end

  def set_review
    @review = Review.find(params[:review_id])
  end
end
