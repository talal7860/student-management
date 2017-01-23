# Course model
class Course < ApplicationRecord
  has_many :teach_classes
  has_many :teachers, through: :teach_classes
  has_many :exams
  has_many :attendances

  validates_presence_of :name
  validates_presence_of :year
end
