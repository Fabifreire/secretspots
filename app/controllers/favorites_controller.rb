class FavoritesController < ApplicationController

  def create
    @spot = Spot.find(params[:spot_id])
    @user = current_user
    @favorite = Favorite.create(user: @user, spot: @spot)
    @favorites = @user.favorites
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @spot = Spot.find(params[:spot_id])
    @user = current_user
    @favorites = @user.favorites
    @favorite = Favorite.find_by(user: @user, spot: @spot)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end
