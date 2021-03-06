class FavoritesController < ApplicationController
  before_action :set_user, :set_spot
  def create
    @favorite = Favorite.create(user: @user, spot: @spot)
    @favorites = @user.favorites
    # redirect_back(fallback_location: root_path)
    # redirect_to dashboard_path(anchor: :favorites)
  end
  
  def destroy
    @favorites = @user.favorites
    @favorite = Favorite.find_by(user: @user, spot: @spot)
    @favorite.destroy
    # redirect_to dashboard_path(anchor: :favorites)
  end


  private 
  def set_user
    @user = current_user
  end

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end
end
