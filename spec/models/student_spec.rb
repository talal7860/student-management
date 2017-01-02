require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:picture) }
    it { should validate_presence_of(:student_class) }
    it { should validate_presence_of(:dob) }
    
    it { should validate_presence_of(:cnic) }
    it { should validate_uniqueness_of(:cnic) }

    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:studying_status) }
    it { should validate_presence_of(:teacher_remarks) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:branch_id) }
    it { should validate_presence_of(:matric_roll_no) }
    it { should validate_presence_of(:matric_marks) }
  end
end
