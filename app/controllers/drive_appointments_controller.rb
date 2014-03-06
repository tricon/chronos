class DriveAppointmentsController < ApplicationController
  respond_to :html
  before_action :authenticate_user!, only: [:index]
  before_action :store_location, only: [:show]
  before_action :set_drive, only: [:new, :create]
  before_action :set_user, only: [:create]


  def index
    @drive_appointments = current_user.drive_appointments
  end

  def new
    if @drive.drive_appointments.where(user_id: current_user.try(:id)).first
      redirect_to notice_drive_path(@drive)
    end
    @drive_appointment = @drive.drive_appointments.build
    @drive_appointment.user = current_user || User.new
  end

  def create
    # TODO: DRY this up.
    if @drive.drive_appointments.where(user_id: @user.id).first
      return redirect_to notice_drive_path(@drive)
    end
    @drive_appointment = DriveAppointment.new(drive_appointment_params)
    @drive_appointment.user = @user

    if @drive_appointment.save
      UserMailer.appointment_confirmation(@user, @drive_appointment).deliver
    end

    respond_with(@drive_appointment, location: confirmation_drive_path(@drive_appointment.drive))
  end


  private

  def set_drive
    @drive = Drive.find(params[:drive_id])
  end

  def set_user
    @user = current_user ? current_user : User.where(email: user_params[:email]).first_or_initialize(user_params)
    @user.new_record? ? @user.save : @user.update(user_params)
  end

  def drive_appointment_params
    params.require(:drive_appointment).permit(:drive_slot_id)
  end

  def user_params
    params.require(:drive_appointment).require(:user_attributes).permit([:id, :name, :email, :phone])
  end
end
