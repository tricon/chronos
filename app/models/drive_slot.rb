class DriveSlot < ActiveRecord::Base
  belongs_to :drive

  has_many :drive_appointments, dependent: :destroy

  validate :max_number_of_appointments


  def to_s
    "#{slot_at}"
  end


  protected

  def max_number_of_appointments
    errors.add(:drive_appointments, "max number of appointments already met") if drive_appointments.size > drive.appointments_available_per_slot
  end
end
