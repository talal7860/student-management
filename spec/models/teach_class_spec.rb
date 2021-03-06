require 'rails_helper'

RSpec.describe TeachClass, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :teacher }
    it { should validate_presence_of :course }
    it { should validate_presence_of :branch }
  end
end
