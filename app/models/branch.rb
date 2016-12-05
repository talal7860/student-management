class Branch < ApplicationRecord
	enum studying_status: [ :male, :female]
	has_many :students
	has_many :teach_classes
end
