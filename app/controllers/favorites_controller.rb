class FavoritesController < ApplicationController
  before_action :set_user, :set_spot
  def create
    @favorite = Favorite.create(user: @user, spot: @spot)
    @favorites = @user.favorites.order(created_at: :desc)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorites = @user.favorites.order(created_at: :desc)
    @favorite = Favorite.find_by(user: @user, spot: @spot)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end


  private 
  def set_user
    @user = current_user
  end

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end
end
