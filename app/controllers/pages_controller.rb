class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :map ]

  def home
  end

  def map
    @spots = Spot.all.order(created_at: :desc)

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
    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { spot: spot })
      }
    end
  end
end
