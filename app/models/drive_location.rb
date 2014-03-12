class DriveLocation < ActiveRecord::Base
  belongs_to :drive


  def complete_address
    "#{address} #{address_extended} #{city}, #{state} #{zip}"
  end
end
