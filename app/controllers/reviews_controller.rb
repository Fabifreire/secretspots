class ReviewsController < ApplicationController
  before_action :find_spot

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    
    @review.spot = @spot
    @review.user = current_user
    if @review.save
      redirect_to spot_path(@spot, anchor: :reviews)
    else
      render "new"
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
     raise
     # if @review.user == current_user || current_user.moderator?
      @review.destroy
      redirect_to spot_path(@review.spot)
     #else
      #flash.now[:alert] = "Sorry, you dont have that permission."
     # render "spots/show"
     #end
  end

end

  private

  def reviews_params
    params.require(:review).permit(:description, :rating, :spot_id, :user_id, photos: [] )
  end

  def find_spot
    @spot = Spot.find(params[:spot_id])
  end

end
