json.array!(@drive_locations) do |drive_location|
  json.extract! drive_location, :id, :name, :address, :address_extended, :city, :state, :zip, :country, :drive_id
  json.url drive_location_url(drive_location, format: :json)
end
