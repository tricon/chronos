class DriveAppointment < ActiveRecord::Base
  belongs_to :drive_slot, counter_cache: true
  belongs_to :user

  has_one :drive, through: :drive_slot

  accepts_nested_attributes_for :user, allow_destroy: true
end
