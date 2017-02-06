# Application mailer
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@baitunnoor.com'
  layout 'mailer'
end
