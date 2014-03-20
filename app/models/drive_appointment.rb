class DriveAppointment < ActiveRecord::Base
  belongs_to :drive_slot, counter_cache: true
  belongs_to :user

  has_one :drive, through: :drive_slot

  delegate :to_s, :slot_at, to: :drive_slot

  accepts_nested_attributes_for :user, allow_destroy: true

  validates :drive_slot, :drive_slot_id, presence: true
  validate :max_number_of_appointments


  protected

  def max_number_of_appointments
    errors.add(:drive_slot, "max number of appointments already met") if drive_slot.drive_appointments.size >= drive.appointments_available_per_slot
  end
end
