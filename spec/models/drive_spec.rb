require 'spec_helper'

describe Drive do
  before(:each) do
    @drive = create(:drive_with_slots_and_appointments)
  end

  it "calculates the number of maximum slots available" do
    expect(@drive.max_slots).to eq(@drive.drive_slots.count * @drive.appointments_available_per_slot)
  end

  it "calculates the number of slots filled" do
    expect(@drive.slots_filled).to eq(@drive.drive_appointments.count)
  end
end
