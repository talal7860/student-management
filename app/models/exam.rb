# Exam model
class Exam < ApplicationRecord
  enum exam_type: [:mid_term, :final, :class_test]
  belongs_to :course
  belongs_to :teacher
  belongs_to :student

  validates_presence_of :course_id
  validates_presence_of :teacher_id
  validates_presence_of :student_id
  validates_presence_of :exam_type
  validates_presence_of :marks_obtained
  validates_presence_of :total_marks
end
