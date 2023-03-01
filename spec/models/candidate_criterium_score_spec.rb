require 'rails_helper'

RSpec.describe CandidateCriteriumScore, type: :model do

  describe 'associations' do
    it { should belong_to(:candidate) }
    it { should belong_to(:criterium) }
  end

  describe 'validations' do
    it { should validate_presence_of(:score) }

    it do
      should validate_inclusion_of(:score)
               .in_range(1..5)
               .with_message('(%{value}) can\'t be less 1 and more 5')
    end

    it do
      should validate_uniqueness_of(:candidate_id)
               .scoped_to(:criterium_id)
    end
  end

end
