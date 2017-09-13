require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:user_name)}
    it { should validate_presence_of(:age)}
    it do
      should validate_numericality_of(:age).
        is_less_than_or_equal_to(87)
      end
    it do
      should validate_numericality_of(:age).
        is_greater_than_or_equal_to(18)
      end
  end

  describe 'associations' do
    it { should have_many(:cadavers) }
  end

end
