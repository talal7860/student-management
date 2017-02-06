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
  describe 'parent creation' do
    it 'should set a reset password token for a parent' do
      student = FactoryGirl.create(:student)
      student.save
      expect(student.parent.reset_password_token).not_to be_nil
    end
    it 'should send a reset password email to parent' do
      expect{ FactoryGirl.create(:student) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
    it 'should add parent id to student if it already exists or it is newly created' do
      student = FactoryGirl.create(:student)
      expect(student.parent_id).not_to be_nil
    end
  end
end
