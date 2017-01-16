class TeachClass < ApplicationRecord
	belongs_to :teacher
	belongs_to :course
	belongs_to :branch

  validates_presence_of :teacher
  validates_presence_of :course
  validates_presence_of :branch
  validates_numericality_of :student_year

  def student
  end
end