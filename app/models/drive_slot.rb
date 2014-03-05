class DriveSlot < ActiveRecord::Base
  belongs_to :drive

  has_many :drive_appointments, inverse_of: :drive_slot, dependent: :destroy

  validate :max_number_of_appointments


  def to_s
    slot_at.to_s(:long_ordinal_with_time)
  end


  protected

  def max_number_of_appointments
    errors.add(:drive_appointments, "max number of appointments already met") if drive_appointments.size > drive.appointments_available_per_slot
  end
end
