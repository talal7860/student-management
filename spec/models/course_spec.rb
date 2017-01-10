require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "Validates" do
    it { should validate_presence_of (:name) }
    it { should validate_presence_of (:year) }
    it { should have_many(:teachers)
          .with_foreign_key(:user_id)
          .class_name("User")
          .through(:teach_class) 
        }
    it { should have_many :exams }
    it { should have_many :attendances }
  end
end
