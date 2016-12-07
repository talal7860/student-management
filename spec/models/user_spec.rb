require 'rails_helper'

RSpec.describe User, type: :model do
	describe "Validations" do
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:password) }
		it { should have_many(:students) }
		it { should have_many(:courses) }
		it { should validate_uniqueness_of(:email).case_insensitive }
		it { should validate_uniqueness_of(:phone).case_insensitive }
	end
end
