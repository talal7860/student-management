# Application mailer
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@baitunnoor.herokuapp.com'
  layout 'mailer'
end
