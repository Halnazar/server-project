RSpec.describe PositionCriteriumScore, type: :model do
  describe "associations" do
    it { should belong_to(:position) }
    it { should belong_to(:criterium) }
  end

  describe "validations" do
    it { should validate_presence_of(:score) }
    it { should validate_inclusion_of(:score).in_range(1..5).with_message(/can't be less 1 and more 5/) }
    it { should validate_uniqueness_of(:position_id).scoped_to(:criterium_id) }
  end
end
