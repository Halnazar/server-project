require 'rails_helper'

RSpec.describe Candidate, type: :model do
  describe "associations" do
    it { should belong_to(:vacancy) }
    it { should belong_to(:user) }
    it { should have_many(:candidate_criterium_scores).dependent(:delete_all) }
    it { should have_one_attached(:avatar) }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:second_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:number) }
    it { should validate_inclusion_of(:status).in_range(0..2).with_message(/can't be less 0 and more 2/) }
  end

  describe "enums" do
    it { should define_enum_for(:gender).with_values(male: true, female: false) }
    # it { should define_enum_for(:status).with_values(Отклонён: 0, Рассматривается: 1, Принят: 2) }
  end

  describe "scopes" do
    it ".rejected" do
      rejected_candidate = FactoryBot.create(:candidate, status: 0)
      reviewed_candidate = FactoryBot.create(:candidate, status: 1)
      accepted_candidate = FactoryBot.create(:candidate, status: 2)
      expect(Candidate.rejected).to eq([rejected_candidate])
    end

    it ".reviewed" do
      rejected_candidate = FactoryBot.create(:candidate, status: 0)
      reviewed_candidate = FactoryBot.create(:candidate, status: 1)
      accepted_candidate = FactoryBot.create(:candidate, status: 2)
    end
  end
end
