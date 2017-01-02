require 'rails_helper'

RSpec.describe Fee, type: :model do
  describe "Validates" do
    it { should validate_presence_of (:student_id) }
    it { should validate_presence_of (:amount) }
    it { should validate_presence_of (:pay_date) }
    it { should validate_presence_of (:pay_status) }
  end
end
