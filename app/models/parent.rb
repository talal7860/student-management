class Parent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :students, foreign_key: :parent_id
  accepts_nested_attributes_for :students

  before_validation :set_password,

  :email.downcase

  validates_uniqueness_of :phone, :numericality => true
  validates_uniqueness_of :cnic, :numericality => true
  validates_presence_of :name, :cnic, :phone, :email
  validates_plausible_phone :phone, country_number: '92'

  private

  def set_password
    if !self.password
      generated_password = Devise.friendly_token.first(8)
      self.password = generated_password
      self.password_confirmation = generated_password
    end
  end
end
