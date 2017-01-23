require 'rails_helper'

RSpec.describe Exam, type: :model do
  describe 'Validates' do
    it { should validate_presence_of :course_id }
    it { should validate_presence_of :teacher_id }
    it { should validate_presence_of :student_id }
    it { should validate_presence_of :exam_type }
    it { should validate_presence_of :marks_obtained }
    it { should validate_presence_of :total_marks }
  end
end
