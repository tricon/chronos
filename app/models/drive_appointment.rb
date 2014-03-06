class DriveAppointment < ActiveRecord::Base
  belongs_to :drive_slot, counter_cache: true
  belongs_to :user

  has_one :drive, through: :drive_slot

  delegate :to_s, :slot_at, to: :drive_slot

  accepts_nested_attributes_for :user, allow_destroy: true

  validates :drive_slot, :drive_slot_id, presence: true
end
