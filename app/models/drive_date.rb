class DriveDate < ActiveRecord::Base
  belongs_to :drive

  just_define_datetime_picker :starts_at
  just_define_datetime_picker :ends_at

  validates :starts_at, :ends_at, presence: true


  def to_s
    "#{starts_at} - #{ends_at}"
  end
end
