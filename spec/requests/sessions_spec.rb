require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  describe "POST #create" do
    let(:user) { create(:user) }

    context "when valid credentials are provided" do
      before do
        post :create, params: { user: { email: user.email, password: user.password } }
      end

      it "returns a JWT token" do
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body)).to have_key('token')
      end

      it "returns the user id" do
        expect(JSON.parse(response.body)).to have_key('user_id')
      end
    end

    context "when invalid credentials are provided" do
      before do
        post :create, params: { user: { email: user.email, password: 'wrong_password' } }
      end

      it "returns a validation error" do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body)).to eq({ "errors" => { "email or password" => ["is invalid"] } })
      end
    end
  end
end
