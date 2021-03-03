class ReviewsController < ApplicationController
  before_action :find_spot

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @review.bench = @spot
    @review.user = current_user
    if @review.save
      redirect_to spot_path(@spot)
    else
      render "new"
    end

  def destroy
  end

  end

  private

  def reviews_params
    params.require(:review).permit(:description, :rating, :spot_id, :user_id)
  end

  def find_bench
    @spot = Spot.find(params[:bench_id])
  end

end
