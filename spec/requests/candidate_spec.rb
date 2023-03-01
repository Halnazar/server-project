RSpec.describe CandidatesController, type: :controller do

  describe "GET #index" do
    before { get :index }

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end

    it "returns a JSON response with candidate data" do
      json_response = JSON.parse(response.body)
      expect(json_response["data"]).not_to be_nil
    end
  end

  describe "POST #create" do
    let(:valid_params) do
      {
        candidate: {
          firstName: "John",
          secondName: "Doe",
          email: "john.doe@example.com",
          number: "123-456-7890",
          expYears: 5,
          bio: "Lorem ipsum",
          vacancyId: 1,
          currentUserId: 1,
          gender: "1",
          scores: {
            "1": 3,
            "2": 4,
            "3": 5
          }
        }
      }
    end

    context "with valid params" do
      it "creates a new candidate" do
        expect {
          post :create, params: valid_params
        }.to change(Candidate, :count).by(1)
      end

      it "creates candidate_criterium_scores" do
        expect {
          post :create, params: valid_params
        }.to change(CandidateCriteriumScore, :count).by(3)
      end

      it "returns http success" do
        post :create, params: valid_params
        expect(response).to have_http_status(:ok)
      end

      it "returns a JSON response with candidate data" do
        post :create, params: valid_params
        json_response = JSON.parse(response.body)
        expect(json_response["data"]).not_to be_nil
      end
    end

    context "with invalid params" do
      before { valid_params[:candidate][:email] = "" }

      it "does not create a new candidate" do
        expect {
          post :create, params: valid_params
        }.to change(Candidate, :count).by(0)
      end

      it "does not create candidate_criterium_scores" do
        expect {
          post :create, params: valid_params
        }.to change(CandidateCriteriumScore, :count).by(0)
      end

      it "returns http unprocessable_entity" do
        post :create, params: valid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns an error message" do
        post :create, params: valid_params
        json_response = JSON.parse(response.body)
        expect(json_response["status"]).to eq("error")
      end
    end
  end

  describe "PATCH #update" do
    let(:candidate) { create(:candidate) }

    context "when rejecting a candidate" do
      before { patch :update, params: { id: candidate.id, reject_it: true } }

      it "updates candidate status to 0" do
        expect(candidate.reload.status).to eq(0)
      end

      it "returns http success" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "when accepting a candidate" do
      let(:vacancy) { create(:vacancy) }

      before do
        vacancy.candidates << candidate
        patch :update, params: { id: candidate.id }
      end
    end
  end
end
