require 'rails_helper'
RSpec.describe Parent, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:email) }
    it "should make sure that password is not empty" do
      parent = FactoryGirl.create(:parent)
      expect(parent.encrypted_password).not_to be_nil
    end
    it { should have_many(:students) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_uniqueness_of(:phone) }
    it { should validate_uniqueness_of(:cnic) }
    it { should validate_presence_of(:cnic) }
    it { should validate_presence_of(:phone) }
  end
end
