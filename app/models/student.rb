# Student model
class Student < ApplicationRecord
  has_attached_file :picture, styles: { medium: '300x300', thumb: '200x200' }
  validates_attachment :picture,
                       content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png'] }

  attr_accessor :parent_cnic, :parent_name, :parent_email, :parent_phone
  enum studying_status: [:enrolled, :passed_out, :dismissed]
  enum gender: [:male, :female]
  belongs_to :parent
  validates_presence_of :parent_cnic,
                        :parent_name,
                        :parent_email,
                        :parent_phone,
                        if: :parent_id_not_set
  belongs_to :branch
  has_many :fees
  has_many :teach_classes
  has_many :exams
  has_many :attendances

  before_validation :create_parent

  validates_presence_of :name,
                        :parent_id,
                        :branch_id,
                        :picture,
                        :student_class,
                        :dob,
                        :gender,
                        :address,
                        :email,
                        :studying_status,
                        :matric_roll_no,
                        :matric_marks,
                        :cnic
  validates_uniqueness_of :cnic, :email

  private

  def create_parent
    return unless parent_cnic.present?
    self.parent = Parent.where('cnic = ? or email = ?', parent_cnic, parent_email).first
    if self.parent.nil?
      self.parent = Parent.create!(
        name: parent_name,
        cnic: parent_cnic,
        email: parent_email,
        phone: parent_phone
      )
    else
      self.parent.update!(
        name: parent_name,
        cnic: parent_cnic,
        email: parent_email,
        phone: parent_phone
      )
    end
  end

  def parent_id_not_set
    self.parent_id.nil?
  end
end
