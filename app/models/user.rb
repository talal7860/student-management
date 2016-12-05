class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #Parent is already in use by rails
  enum role: [ :students_parent, :teacher ]
  has_many :students
  has_many :teach_classes
  has_many :exams
end
