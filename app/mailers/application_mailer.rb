class ApplicationMailer < ActionMailer::Base
  default from: Settings.from_mail_default
  layout "mailer"
end
