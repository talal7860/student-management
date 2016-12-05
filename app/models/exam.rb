class Exam < ApplicationRecord
	belongs_to :courses
	belongs_to :users
	belongs_to :students
end
