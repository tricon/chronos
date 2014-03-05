class Drive < ActiveRecord::Base
  has_many :drive_dates, dependent: :destroy
  has_many :drive_slots, -> { order("drive_slots.slot_at ASC") }, dependent: :destroy do
    def available
      where(DriveSlot.arel_table[:drive_appointments_count].lt(proxy_association.owner.appointments_available_per_slot))
    end
  end
  has_many :drive_appointments, through: :drive_slots

  accepts_nested_attributes_for :drive_dates, allow_destroy: true

  validates :recurs_every, presence: true

  after_create :generate_slots


  alias_attribute :to_s, :name


  def time_frame
    earliest_date = drive_dates.order(starts_at: :asc).first
    latest_date = drive_dates.order(ends_at: :desc).first
    "#{earliest_date.starts_at.to_s(:long_ordinal_date)} - #{latest_date.ends_at.to_s(:long_ordinal_date)}"
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
