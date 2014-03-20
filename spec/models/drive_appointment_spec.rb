require 'spec_helper'

describe DriveAppointment do
  context "a drive appointment is created" do
    before(:each) do
      @drive = create(:drive_with_slots_and_appointments)
    end

    it "should not save if the maximum number of appointments per slot has been met" do
      lambda {
        @drive.drive_slots.first.drive_appointments.create
      }.should_not change(@drive.drive_appointments, :size)
    end
  end
end
