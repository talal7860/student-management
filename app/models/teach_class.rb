class TeachClass < ApplicationRecord
	belongs_to :student
	belongs_to :user
	belongs_to :course
	belongs_to :branch

  validates_presence_of :student
  validates_presence_of :user
  validates_presence_of :course
  validates_presence_of :branch
end