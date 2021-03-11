class OutlawsController < ApplicationController
  def banned
		user1 = User.find(params[:id])
		user1.update(banned: :true)
		user1.spots.destroy_all
		user1.reviews.destroy_all
		user1.likes.destroy_all
		user1.favorites.destroy_all
		flash[:error] = "User succesfully banned"
		redirect_to dashboard_path(anchor: "outlaw_id_#{params[:id]}")
  end
end
