# Parent model
class Parent < ApplicationRecord
  include AccountSetting
  has_many :students
end
