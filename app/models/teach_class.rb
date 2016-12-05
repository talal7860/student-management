class TeachClass < ApplicationRecord
	belongs_to :student
	belongs_to :user
	belongs_to :course
	belongs_to :branch
end
