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

  it "selects the number of available drive slots" do
    @drive.drive_slots.each { |ds| 2.times { ds.drive_appointments.create!(user_id: 1) }}
    drive_slot = @drive.drive_slots.create(slot_at: "2014-03-04 17:43:41")

    expect(@drive.drive_slots.available.to_a).to eq([drive_slot])
  end

  it "selects the drive slots that are today" do
    drive_slot = @drive.drive_slots.create(slot_at: Time.now)

    expect(@drive.drive_slots.today.to_a).to eq([drive_slot])
  end
end
