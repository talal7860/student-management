class Attendance < ApplicationRecord
  enum status: [ :present, :absent, :leave]
  belongs_to :student
  belongs_to :course
  validates_presence_of :student, :course, :date
end
