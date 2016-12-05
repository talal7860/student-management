class Student < ApplicationRecord
	enum studying_status: [ :enrolled, :passed_out, :dismissed]
	belongs_to :user
	belongs_to :branch
	has_many :fees
	has_many :teach_classes
	has_many :exams
	has_many :attendances
end
