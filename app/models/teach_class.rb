# Teach_class model
class TeachClass < ApplicationRecord
  belongs_to :teacher
  belongs_to :course
  belongs_to :branch

  validates_presence_of :teacher
  validates_presence_of :course
  validates_presence_of :branch

  def student
  end
end
