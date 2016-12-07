class Course < ApplicationRecord
	has_many :teachers, foreign_key: :user_id, class_name: "User", through: :teach_class
	has_many :exams
	has_many :attendances
	has_many :books
end
