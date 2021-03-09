class ReportsController < ApplicationController
  before_action :set_report, only: %i[update]
  def update
    @report.done = true
    @report.save
    flash.now[:alert] = "Thank you for accomplishing the mission so diligently!
    Secretspots society is eternally grateful to you."
    redirect_to dashboard_path(anchor: :done)
  end

  private
  def set_report
    @report = Report.find(params[:id])
  end
end
