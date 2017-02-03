# custom mailer class
class UserMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers

  def welcome_password_mail(record, token, opts = {})
    @password_token = token
    @url = ENV["APP_URL"] + "#/password-reset?password_reset_token=#{@password_token}"
    devise_mail(record, :confirmation_instructions, opts)
  end
end
