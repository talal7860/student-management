class Course < ApplicationRecord
	has_many :teach_classes
	has_many :exams
	has_many :attendances
	has_many :books
end
