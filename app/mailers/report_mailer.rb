class ReportMailer < ActionMailer::Base
  default from: "no-reply@blooddrive.me"

  def donor_report(emails)
    @drives = Drive.all

    mail to: emails, subject: "#{Time.now.strftime("%Y-%m-%d")} - Blood Drive Report"
  end
end
