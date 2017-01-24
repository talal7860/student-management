# Parent model
class Parent < ApplicationRecord
  include AccountSetting
  has_many :students
  has_many :exams, through: :students
  has_many :attendances, through: :students
end
