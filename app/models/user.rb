class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #Parent is already in use by rails
  enum role: [ :students_parent, :teacher, :both ]
  has_many :students, foreign_key: :parent_id
  has_many :teach_classes
  has_many :courses, through: :teach_classes
  has_many :exams
  :email.downcase
  validates_uniqueness_of :email
  validates_uniqueness_of :phone, :case_sensitive => false
end
