require 'rails_helper'

RSpec.describe Branch, type: :model do
  describe "Validates" do
    it { should validate_presence_of (:name) }
    it { should validate_presence_of (:branch_type) }
  end
end
