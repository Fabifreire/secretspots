class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :fetch_spot, only: :show

  def index
    @spots = Spot.all.order(created_at: :desc)
    @categories = %w[monument mirador panoramic beach bay cliff]
    # search 
    if params[:query].present? 
      sql_query = " \
        spots.name @@ :query \
        OR spots.address @@ :query \
        OR spots.category @@ :query \
      "
      @spots = Spot.where(sql_query, query: "%#{params[:query]}%")
    else 
      @spots = Spot.all.order(created_at: :desc)
    end
    if @spots.empty?
    flash.now[:alert] = "Sorry, we could not find what you're looking for."
    end
  end

  def show
    @spot = Spot.find(params[:id])
	end


	private

  def fetch_spot
    @spot = Spot.find(params[:id])
  end

  def spots_params
    params.require(:spot).permit(:name, :address, :description, :category)
  end
end
