RSpec.describe CriteriaController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response with criteria data' do
      criterium = create(:criterium)
      get :index
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['data'].size).to eq(1)
      expect(JSON.parse(response.body)['data'].first['id']).to eq(criterium.id.to_s)
      expect(JSON.parse(response.body)['data'].first['name']).to eq(criterium.name)
    end
  end

  describe 'POST #create' do
    it 'creates a new criterium and returns a successful response' do
      expect do
        post :create, params: { criterium_name: 'New Criterium' }
      end.to change { Criterium.count }.by(1)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('location.reload()')
    end
  end
end
