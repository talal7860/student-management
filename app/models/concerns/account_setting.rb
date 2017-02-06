require 'active_support/concern'
# account setting concern
module AccountSetting
  extend ActiveSupport::Concern
  included do
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    before_validation :set_password, :downcase_email
    before_create :generate_reset_password_token
    after_create :send_welcome_mail

    validates_uniqueness_of :phone, numericality: :true
    validates_uniqueness_of :cnic, numericality: :true
    validates_presence_of :name, :cnic, :phone, :email
    validates_numericality_of :cnic
    validates_plausible_phone :phone, country_number: '92'
  end

  private

  def set_password
    return false if self.password or self.id.present?
    generated_password = Devise.friendly_token.first(8)
    self.password = generated_password
    self.password_confirmation = generated_password
  end

  def generate_reset_password_token
    raw, enc = Devise.token_generator.generate(self.class, :reset_password_token)
    self.reset_password_token   = enc
    self.reset_password_sent_at = Time.now.utc
    @token = raw
  end

  def send_welcome_mail
    UserMailer.welcome_password_mail(self, @token).deliver
  end

  def downcase_email
    :email.downcase if email.present?
  end
end
