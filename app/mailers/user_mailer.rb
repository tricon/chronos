class UserMailer < ActionMailer::Base
  default from: "no-reply@blooddrive.me"

  def appointment_confirmation(user, drive_appointment)
    @user = user
    @drive_appointment = drive_appointment
    mail to: user.email, subject: "#{drive_appointment.drive.name} Blood Drive Appointment Confirmation"
  end
end
