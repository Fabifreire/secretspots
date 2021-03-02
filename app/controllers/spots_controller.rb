class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :fetch_spot, only: :show

  def index
    @spots = Spot.all.order(created_at: :desc)
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
