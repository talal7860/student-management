class Branch < ApplicationRecord
	enum branch_type: [ :male, :female]
	has_many :students
	has_many :teach_classes

  validates_presence_of :name
  validates_presence_of :branch_type
end
