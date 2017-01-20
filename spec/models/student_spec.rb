require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :picture }
    it { should validate_presence_of :student_class }
    it { should validate_presence_of :dob }

    it { should validate_presence_of :parent_id }

    it { should validate_presence_of :cnic }
    it { should validate_uniqueness_of :cnic }

    it { should validate_presence_of :address }
    it { should validate_presence_of :studying_status }
    it { should validate_presence_of :branch_id }
    it { should validate_presence_of :matric_roll_no }
    it { should validate_presence_of :matric_marks }
    it { should belong_to :parent }
  end
  # describe 'parent creation' do
  #   it 'should create parent if parent id is not given' do
  #     user = FactoryGirl.build(:parent)
  #     user.cnic = 'asdf'
  #     user.name = 'blan'
  #     user.email = 'blan@blan.com'
  #     user.phone = '+923223223222'
  #     user.save
  #     expect(user.id).not_to be_nil
  #   end
  #   it 'should add parent id to student if it already exists or it is newly created' do
  #     student = FactoryGirl.create(:student)
  #     expect(student.parent_id).not_to be_nil
  #   end
  # end
end
