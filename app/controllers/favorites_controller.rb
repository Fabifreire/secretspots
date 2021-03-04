class FavoritesController < ApplicationController

  def create
    @spot = Spot.find(params[:spot_id])
    @user = current_user
    @favorite = Favorite.create(user: @user, spot: @spot)
    @favorites = @user.favorites
    
  end
  
  def destroy
    @spot = Spot.find(params[:spot_id])
    @user = current_user
    @favorites = @user.favorites
    @favorite = Favorite.find_by(user: @user, spot: @spot)
    @favorite.destroy
  end

end
