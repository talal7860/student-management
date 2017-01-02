class Exam < ApplicationRecord
	belongs_to :courses
	belongs_to :users
	belongs_to :students

  validates_presence_of :course_id
  validates_presence_of :teacher_id
  validates_presence_of :student_id
  validates_presence_of :exam_type
  validates_presence_of :marks_obtained
  validates_presence_of :total_marks
end
