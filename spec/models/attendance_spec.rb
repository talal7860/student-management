require 'rails_helper'

RSpec.describe Attendance, type: :model do
  describe 'Validates' do
    it { should validate_presence_of :student }
    it { should validate_presence_of :course }
    it { should validate_presence_of :date }
  end
end
