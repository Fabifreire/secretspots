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
      redirect_to spot_path(@spot)
    else
      render "new"
    end

  def show
    @review = Review.find params[:id]
    @report = @review.reports.new
  end

  def destroy
  end

end

  private

  def reviews_params
    params.require(:review).permit(:description, :rating, :spot_id, :user_id)
  end

  def find_spot
    @spot = Spot.find(params[:spot_id])
  end

end
