class DrivesController < ApplicationController
  before_filter :store_location, only: [:show]
  before_filter :set_drive, only: [:show, :confirmation]

  def index
    @drives = Drive.all
  end

  def show
    @drive_appointment = @drive.drive_appointments.where(user_id: current_user.try(:id)).first || @drive.drive_appointments.build
    @drive_appointment.user = current_user || User.new
  end

  def confirmation
  end


  private

  def set_drive
    @drive = Drive.find(params[:id])
  end
end
