class Student < ApplicationRecord
  has_attached_file :picture, :styles => { :medium =>     "300x300", :thumb => "200x200" }
  validates_attachment :picture, content_type: { content_type:     ["image/jpg", "image/jpeg", "image/png"] }

	enum studying_status: [ :enrolled, :passed_out, :dismissed]
  #Role = parent
	belongs_to :parent, foreign_key: :parent_id, class_name: "User"
	belongs_to :branch
	has_many :fees
	has_many :teach_classes
	has_many :exams
	has_many :attendances

  validates_presence_of :name,
   :parent_id,
   :branch_id,
   :picture,
   :student_class,
   :dob

  validates_presence_of :cnic
  validates_uniqueness_of :cnic

  validates_presence_of :address
  validates_presence_of :studying_status
  validates_presence_of :matric_roll_no
  validates_presence_of :matric_marks
end
