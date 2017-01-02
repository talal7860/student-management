require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "Validates" do
    it { should validate_presence_of (:name) }
    it { should validate_presence_of (:year) }
  end
end
