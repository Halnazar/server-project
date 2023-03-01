RSpec.describe Vacancy, type: :model do
  describe "scopes" do
    describe ".opened" do
      it "returns vacancies with status false" do
        opened_vacancy = create(:vacancy, status: false)
        closed_vacancy = create(:vacancy, status: true)
        expect(Vacancy.opened).to eq([opened_vacancy])
      end
    end

    describe ".closed" do
      it "returns vacancies with status true" do
        opened_vacancy = create(:vacancy, status: false)
        closed_vacancy = create(:vacancy, status: true)
        expect(Vacancy.closed).to eq([closed_vacancy])
      end
    end
  end

  describe "#status_name" do
    it "returns 'Открыта' when status is false" do
      vacancy = create(:vacancy, status: false)
      expect(vacancy.status_name).to eq("Открыта")
    end

    it "returns 'Закрыта' when status is true" do
      vacancy = create(:vacancy, status: true)
      expect(vacancy.status_name).to eq("Закрыта")
    end
  end

  describe "#close!" do
    it "changes status to true and sets closing date to today's date" do
      vacancy = create(:vacancy, status: false)
      expect {
        vacancy.close!
      }.to change { vacancy.status }.from(false).to(true)
                                    .and change { vacancy.closing_date }.to(Date.today)
    end

    it "saves the vacancy" do
      vacancy = create(:vacancy, status: false)
      expect {
        vacancy.close!
      }.to change { vacancy.reload.updated_at }
    end

    it "rolls back the transaction if an error occurs" do
      vacancy = create(:vacancy, status: false)
      expect(vacancy).to receive(:save!).and_raise("An error")
      expect {
        expect {
          vacancy.close!
        }.to raise_error("An error")
      }.not_to change { vacancy.reload.status }
    end
  end

  describe "#to_s" do
    it "returns 'Вакансия №{id}: {position name}'" do
      position = create(:position, name: "Developer")
      vacancy = create(:vacancy, position: position)
      expect(vacancy.to_s).to eq("Вакансия №#{vacancy.id}: Developer")
    end
  end

  describe "associations" do
    it { should belong_to(:position) }
    it { should have_many(:candidates) }
  end

  describe "callbacks" do
    describe "#set_opening_date" do
      it "sets opening_date to the current time before saving" do
        vacancy = create(:vacancy, opening_date: nil)
        expect(vacancy.opening_date).not_to be_nil
      end
    end
  end

  describe "validations" do
    it { should validate_presence_of(:position) }

    describe "status" do
      it { should validate_presence_of(:status) }

      it "validates inclusion in [true, false]" do
        vacancy = build(:vacancy, status: nil)
        vacancy.valid?
        expect(vacancy.errors[:status]).to include("is not included in the list")
      end
    end
  end
end
