# Parent model
class Parent < ApplicationRecord
  include AccountSetting
  include DeviseTokenAuth::Concerns::User
  has_many :students
  has_many :exams, through: :students
  has_many :attendances, through: :students
end
