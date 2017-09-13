require 'rails_helper'

RSpec.describe Cadaver, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:fresh) }
    it { should validate_presence_of(:healthy) }
    it { should validate_presence_of(:whole) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:age) }
    it do
      should validate_numericality_of(:age).
        is_less_than_or_equal_to(80)
    end
    it do
      should validate_numericality_of(:age).
         is_greater_than_or_equal_to(21)
    end
  end

  describe 'associations' do
    it { should belong_to(:user)}
  end
end
