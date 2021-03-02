class SpotsController < ApplicationController
	before_action :fetch_spot

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
