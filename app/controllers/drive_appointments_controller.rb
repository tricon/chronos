class DriveAppointmentsController < ApplicationController
  before_action :set_drive_appointment, only: [:update]
  before_action :set_user, only: [:create, :update]

  def create
    @drive_appointment = DriveAppointment.new(drive_appointment_params)
    @drive_appointment.user = @user

    @drive_appointment.save

    redirect_to confirmation_drive_path(@drive_appointment.drive)
  end

  def update
    @drive_appointment.update(drive_appointment_params)

    redirect_to confirmation_drive_path(@drive_appointment.drive)
  end


  private

  def set_drive_appointment
    @drive_appointment = DriveAppointment.find(params[:id])
  end

  def set_user
    @user = User.where(email: user_params[:email]).first_or_initialize(user_params)
    @user.new_record? ? @user.save : @user.update(user_params)
  end

  def drive_appointment_params
    params.require(:drive_appointment).permit(:drive_slot_id)
  end

  def user_params
    params.require(:drive_appointment).require(:user_attributes).permit([:id, :name, :email, :phone])
  end
end
