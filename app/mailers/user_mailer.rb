class UserMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
 
  def welcome_password_mail(record, token, opts={})
    @password_token = token
    devise_mail(record, :confirmation_instructions, opts)
  end
end
