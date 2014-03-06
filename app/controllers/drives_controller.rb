class DrivesController < ApplicationController
  before_action :set_drive, only: [:confirmation]

  def index
    @drives = Drive.all
  end

  def confirmation
  end


  private

  def set_drive
    @drive = Drive.find(params[:id])
  end
end
