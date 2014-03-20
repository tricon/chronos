class DriveSlot < ActiveRecord::Base
  belongs_to :drive

  has_many :drive_appointments, inverse_of: :drive_slot, dependent: :destroy


  def to_s
    slot_at.to_s(:long_ordinal_with_time)
  end

  def fill_count
    drive_appointments.size
  end
end
