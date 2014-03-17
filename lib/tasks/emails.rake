namespace :blooddrive do
  desc "Send the donor report"
  task send_donor_report: :environment do
    ReportMailer.donor_report(['rebeccakay@love.com', 'tricon@me.com', 'mrising2@me.com']).deliver
  end
end
