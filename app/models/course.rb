class Course < ApplicationRecord
	has_many :teachers, foreign_key: :user_id, class_name: "User", through: :teach_class
	has_many :exams
	has_many :attendances

  validates_presence_of :name
  validates_presence_of :year
end
