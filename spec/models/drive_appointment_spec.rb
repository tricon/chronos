require 'spec_helper'

describe DriveAppointment do
  context "a drive appointment is created" do
    before(:each) do
      @drive = create(:drive_with_slots_and_appointments)
    end

    it "should not save if the maximum number of appointments per slot has been met" do
      @drive.drive_slots.each { |ds| 2.times { ds.drive_appointments.create!(user_id: 1) }}

      lambda {
        @drive.drive_slots.first.reload.drive_appointments.create(user_id: 1)
      }.should_not change(@drive.drive_appointments, :size)
    end
  end
end
