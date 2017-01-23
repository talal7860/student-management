# Teacher model
class Teacher < ApplicationRecord
  include AccountSetting
  include PictureSetting

  has_many :teach_classes
  has_many :courses, through: :teach_classes
  has_many :exams

  validates_presence_of :picture
end
