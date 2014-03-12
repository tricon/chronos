class DriveLocationsController < ApplicationController
  def show
    @drive_location = DriveLocation.find(params[:id])
  end
end
