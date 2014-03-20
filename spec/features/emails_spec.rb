require "spec_helper"
require "rake"

feature "Emails rake tasks" do
  before :all do
    @rake = Rake::Application.new
    Rake.application = @rake
    load Rails.root + "lib/tasks/emails.rake"
    Rake::Task.define_task(:environment)
  end

  feature "the donation report" do
    let :run_rake_task do
      @rake['blooddrive:send_donor_report'].reenable
      @rake['blooddrive:send_donor_report'].invoke
    end

    scenario "has 'environment' as a prerequisite" do
      @rake['blooddrive:send_donor_report'].prerequisites.should include("environment")
    end

    scenario "is generated and sent" do
      ReportMailer.should_receive(:donor_report).with(['team@lp112.be']).and_return(double("ReportMailer", deliver: true))

      run_rake_task
    end
  end
end
