# Course model
class Course < ApplicationRecord
  has_many :teach_class
  has_many :teachers,
           foreign_key: :teacher_id,
           class_name: 'Teacher',
           through: :teach_class
  has_many :exams
  has_many :attendances

  validates_presence_of :name
  validates_presence_of :year
end
