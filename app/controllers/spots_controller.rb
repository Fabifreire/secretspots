class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :fetch_spot, only:  %i[update show]

  def index
    @spots = Spot.all.order(created_at: :desc)
    @user = current_user
    @categories = Spot::CATEGORIES

    # favorites
    if @user
      @favorites = @user.favorites
    end


    # search
    if params[:query].present?
      sql_query = " \
        spots.name @@ :query \
        OR spots.address @@ :query \
        OR spots.category @@ :query \
      "

      @spots = @spots.where(sql_query, query: "%#{params[:query]}%")
    end
    if params[:category].present?
      @spots = @spots.where(category: params[:category])
    end
    if @spots.empty?
      flash.now[:alert] = "Sorry, we could not find what you're looking for."
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @user = current_user
    @reviews = @spot.reviews
    @pictures = @spot.photos
    @spot.reviews.each do |r|
      if r.photos.attached?
        r.photos.each do |picture|
          @pictures << picture
        end
        @pictures
      end
    end


    if @user
      @favorites = @user.favorites
    end
	end

  def new
    @spot = Spot.new
    @categories = Spot::CATEGORIES
  end

  def create
    @spot = Spot.new(spots_params)
    @spot.user = current_user
    if @spot.save
      redirect_to spot_path(@spot)
    else
      render "new"
    end
  end

   def edit
    @spot = Spot.find(params[:id])
  end

   def update
    # @spot.update(spots_params)
    # redirect_to spot_path(@spot)
    if @spot.user == current_user || current_user.moderator?
      @spot.update
      redirect_to spot_path(@spot)
     else
      flash.now[:alert] = "Sorry, you dont have that permission."
      redirect_to spot_path(@spot)
     end
  end

    def destroy
    @spot = Spot.find(params[:id])
    if current_user
      if @spot.user == current_user || current_user.moderator?
      @spot.destroy
      redirect_to dashboard_path
      else
      flash.now[:alert] = "Sorry, you dont have that permission."
      redirect_to dashboard_path
      end
    end
    end

	private

  def fetch_spot
    @spot = Spot.find(params[:id])
  end

  def spots_params
    params.require(:spot).permit(:name, :address, :description, :category, photos: [])
  end
end
