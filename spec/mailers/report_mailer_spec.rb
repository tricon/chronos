require "spec_helper"

describe ReportMailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  context "the donation report is generated and delivered" do
    before(:each) do
      @drive = create(:drive_with_slots_and_appointments)
      @email = ReportMailer.donor_report(['rebeccakay@love.com', 'tricon@me.com'])
    end

    it "should send the report to Rebecca and David" do
      @email.should deliver_to(['rebeccakay@love.com', 'tricon@me.com'])
    end

    it "should have a subject with the current date" do
      @email.should have_subject("#{Time.now.strftime("%Y-%m-%d")} - Blood Drive Report")
    end

    it "should contain the blood drive title in the email" do
      @email.should have_body_text("Happy Fun Drive")
    end

    it "should contain the blood drive filled slots and max slots count" do
      @email.should have_body_text("Slots filled: #{@drive.slots_filled}/#{@drive.max_slots}")
    end
  end
end
