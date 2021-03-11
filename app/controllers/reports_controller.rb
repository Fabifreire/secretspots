class ReportsController < ApplicationController
  before_action :set_report, only: %i[update]
  # before_action :set_spot, only: %i[create]
  def update
    @report.done = true
    @report.save
    flash.now[:alert] = "Thank you for accomplishing the mission so diligently!
    Secretspots society is eternally grateful to you."
    redirect_to dashboard_path(anchor: :done)
  end

   def create
      @parent = parent
      @report = Report.new(report_params)
      @report.reportable = @parent
      if @report.save
        redirect_to dashboard_path

      else
        render "new"
      end
   end

   def new
      @parent = parent
      @report = Report.new
   end

   private

   def parent
      if params[:spot_id]
        Spot.find params[:spot_id]
      else
        Review.find params[:review_id]
      end
   end

   def report_params
      params.require(:report).permit(:description, :category).merge(user_id: current_user.id)
   end
   
   def set_report
     @report = Report.find(params[:id])
   end

   def set_spot
    @spot = Spot.find(params[:spot_id])
   end
 end
