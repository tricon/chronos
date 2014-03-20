ActiveAdmin.register Drive do
  permit_params :name, :description, :recurs_every, :appointments_available_per_slot,
    drive_dates_attributes: [:id, :starts_at_date, :starts_at_time_hour, :starts_at_time_minute, :ends_at_date, :ends_at_time_hour, :ends_at_time_minute, :_destroy],
    drive_locations_attributes: [:id, :address, :address_extended, :city, :state, :zip]

  show do |drive|
    attributes_table do
      row :id
      row :name
      row :description
      row :recurs_every
      row :appointments_available_per_slot
      row :drive_dates do |drive|
        drive.drive_dates.map(&:to_s).join("<br/>").html_safe
      end
      row :drive_locations do |drive|
        drive.drive_locations.map(&:complete_address).join("<br/>").html_safe
      end
      row :drive_slots do |drive|
        html = "<h3>Slots filled: #{drive.slots_filled}/#{drive.total_appointments_available}</h3>"
        drive.drive_slots.each do |drive_slot|
          html += "- #{drive_slot}<br/>"
          drive_slot.drive_appointments.each { |drive_appointment| html += "&nbsp;&nbsp; #{drive_appointment.user.name}<br/>" }
        end

        html.html_safe
      end
    end

    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :recurs_every, as: :select, collection: ['15 minutes', '30 minutes', '1 hour', '2 hours', '4 hours', '8 hours']
      f.input :appointments_available_per_slot
    end
    f.inputs do
      f.has_many :drive_dates, allow_destroy: true, heading: "Dates" do |dd|
        dd.input :starts_at, as: :just_datetime_picker
        dd.input :ends_at, as: :just_datetime_picker
      end
    end
    f.inputs do
      f.has_many :drive_locations, allow_destroy: true, heading: "Locations" do |dl|
        dl.input :address
        dl.input :address_extended
        dl.input :city
        dl.input :state
        dl.input :zip
      end
    end

    f.actions
  end
end
