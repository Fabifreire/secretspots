class ReportsController < ApplicationController
   def create
      @parent = parent
      @report = Report.new(report_params)
      @report.reportable = @parent
      if @report.save
        redirect_to spots_path
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
 end
