RSpec.describe PositionsController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "returns positions data in json format" do
      position = FactoryBot.create(:position)
      get :index
      expect(JSON.parse(response.body)["data"].first["id"]).to eq(position.id.to_s)
    end
  end

  describe "POST #create" do
    let(:valid_params) { { position: { name: "New Position" } } }
    let(:invalid_params) { { position: { name: "" } } }

    context "with valid parameters" do
      it "creates a new position" do
        expect { post :create, params: valid_params }.to change(Position, :count).by(1)
      end

      it "returns a successful response" do
        post :create, params: valid_params
        expect(response).to be_successful
      end

      it "returns the created position in json format" do
        post :create, params: valid_params
        expect(JSON.parse(response.body)["data"]["attributes"]["name"]).to eq(valid_params[:position][:name])
      end
    end

    context "with invalid parameters" do
      it "does not create a new position" do
        expect { post :create, params: invalid_params }.to_not change(Position, :count)
      end

      it "returns an unprocessable entity response" do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns an error message in json format" do
        post :create, params: invalid_params
        expect(JSON.parse(response.body)["errors"]["name"]).to eq(["can't be blank"])
      end
    end
  end
end
