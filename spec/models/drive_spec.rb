require 'spec_helper'

describe Drive do
  before(:each) do
    @drive = create(:drive_with_slots_and_appointments)
  end

  it "calculates the number of maximum appointments available" do
    expect(@drive.total_appointments_available).to eq(@drive.drive_slots.count * @drive.appointments_available_per_slot)
  end

  it "calculates the number of maximum appointments available including overflow" do
    expect(@drive.total_appointments_available_including_overflow).to eq(@drive.drive_slots.count * @drive.total_appointments_available_per_slot)
  end

  it "calculates the number of slots filled" do
    expect(@drive.slots_filled).to eq(@drive.drive_appointments.count)
  end
end
