class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @spots = Spot.all.order(created_at: :desc)
  end
end
