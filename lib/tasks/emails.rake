namespace :blooddrive do
  desc "Send the donor report"
  task send_donor_report: :environment do
    ReportMailer.donor_report(['team@lp112.be']).deliver
  end
end
