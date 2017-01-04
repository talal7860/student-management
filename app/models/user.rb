class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [ :parent_, :teacher, :both ]
  has_many :students, foreign_key: :user_id
  has_many :teach_classes
  has_many :courses, through: :teach_classes
  has_many :exams
  
  # before_validation :set_password

  :email.downcase
  
  validates_uniqueness_of :phone, :numericality => true
  
  validates_uniqueness_of :cnic, :numericality => true
  
  validates_presence_of :role, :cnic, :phone
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