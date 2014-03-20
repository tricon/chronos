class Drive < ActiveRecord::Base
  has_many :drive_dates, dependent: :destroy
  has_many :drive_slots, -> { order("drive_slots.slot_at ASC") }, dependent: :destroy do
    def available
      where(DriveSlot.arel_table[:drive_appointments_count].lt(proxy_association.owner.total_appointments_available_including_overflow))
    end
  end
  has_many :drive_appointments, through: :drive_slots
  has_many :drive_locations, dependent: :destroy

  accepts_nested_attributes_for :drive_dates, allow_destroy: true
  accepts_nested_attributes_for :drive_locations, allow_destroy: true


  validates :recurs_every, presence: true

  after_create :generate_slots


  alias_attribute :to_s, :name


  def time_frame
    earliest_date = drive_dates.order(starts_at: :asc).first
    latest_date = drive_dates.order(ends_at: :desc).first
    "#{earliest_date.starts_at.to_s(:long_ordinal_date)} - #{latest_date.ends_at.to_s(:long_ordinal_date)}"
  end

  def total_appointments_available
    drive_slots.count * appointments_available_per_slot
  end

  def total_appointments_available_including_overflow
    drive_slots.count * total_appointments_available_per_slot
  end

  def total_appointments_available_per_slot
    appointments_available_per_slot + overflow_appointments_available_per_slot
  end

  def slots_filled
    drive_appointments.count
  end

  private

  def generate_slots
    drive_dates.each do |drive_date|
      current_slot = drive_date.starts_at
      until current_slot >= drive_date.ends_at
        drive_slots.where(DriveSlot.arel_table[:slot_at].eq(current_slot)).first_or_create
        current_slot += eval(recurs_every.gsub(' ', '.')) # MWAHAHAHAH!!!!!!
      end
    end
  end
end
