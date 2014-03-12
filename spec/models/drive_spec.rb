require 'spec_helper'

describe Drive do
  before(:all) do
    @drive = create(:drive_with_slots_and_appointments)
  end

  it "calculates the number of maximum slots available" do
    expect(@drive.max_slots).to eq(50)
  end

  it "calculates the number of slots filled" do
    expect(@drive.slots_filled).to eq(10)
  end
end
