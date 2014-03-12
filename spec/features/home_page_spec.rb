require 'spec_helper'

feature "Home page is viewed" do
  background do
    @drive = create(:drive_with_location)
  end


  scenario "drives are shown" do
    visit root_path

    expect(page).to have_content("Happy Fun Drive")
  end

  scenario "Location maps are shown" do
    visit root_path

    expect(page).to have_css(".location-map")
  end
end
