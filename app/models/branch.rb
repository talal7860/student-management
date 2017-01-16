class Branch < ApplicationRecord
	enum type_: [ :male, :female]
	has_many :students
	has_many :teach_classes

  validates_presence_of :name
  validates_presence_of :type_
end
