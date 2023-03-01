RSpec.describe Position, type: :model do
  subject(:position) { described_class.new(name: "Software Developer") }

  describe "associations" do
    it { is_expected.to have_many(:vacancies).dependent(:delete_all) }
    it { is_expected.to have_many(:position_criterium_scores).dependent(:delete_all) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "#to_s" do
    it "returns the position name as a string" do
      expect(position.to_s).to eq("Software Developer")
    end
  end
end
