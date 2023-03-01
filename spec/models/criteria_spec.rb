RSpec.describe Criterium, type: :model do
  subject { build(:criterium) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:position_criterium_scores).dependent(:delete_all) }
    it { is_expected.to have_many(:candidate_criterium_scores) }
  end
end
