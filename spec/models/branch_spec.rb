require 'rails_helper'

RSpec.describe Branch, type: :model do
  describe 'Validates' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :type_ }
  end
end
