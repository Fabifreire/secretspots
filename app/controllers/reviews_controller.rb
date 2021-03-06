class ReviewsController < ApplicationController
  before_action :find_spot, only: %i[new create ]

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

  def show
    @review = Review.find params[:id]
    @report = @review.reports.new
  end

  def destroy
    @review = Review.find(params[:id])
     if current_user.moderator?
      @review.destroy
      # redirect_to spot_path(@review.spot)
      redirect_to dashboard_path(anchor: :upcoming)

     else
      flash.now[:alert] = "Sorry, you dont have that permission."
      render "spots/show"
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
