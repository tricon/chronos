require "spec_helper"

describe DriveLocationsController do
  describe "routing" do
    it "routes to #show" do
      get("/drive_locations/1").should route_to("drive_locations#show", :id => "1")
    end
  end
end
