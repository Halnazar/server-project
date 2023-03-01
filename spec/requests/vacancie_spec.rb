require 'rails_helper'

RSpec.describe VacanciesController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:position) { create(:position) }

      it 'creates a new vacancy' do
        expect {
          post :create, params: {
            vacancy: {
              positionId: position.id
            }
          }
        }.to change(Vacancy, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: {
          vacancy: {
            positionId: position.id
          }
        }
        expect(response).to be_successful
      end
    end

    context 'with invalid parameters' do
      it 'returns a 400 bad request status' do
        post :create, params: {
          vacancy: {
            positionId: nil
          }
        }
        expect(response).to have_http_status(400)
      end
    end
  end

  describe 'PATCH #update' do
    let(:vacancy) { create(:vacancy) }
    let(:candidate) { create(:candidate, vacancy: vacancy) }

    context 'when setting status to 2' do
      it 'sets the status of the vacancy to true' do
        patch :update, params: {
          id: vacancy.id,
          status: 2,
          candidate_id: candidate.id
        }
        vacancy.reload
        expect(vacancy.status).to eq true
      end

      it 'sets the status of the candidate to 2' do
        patch :update, params: {
          id: vacancy.id,
          status: 2,
          candidate_id: candidate.id
        }
        candidate.reload
        expect(candidate.status).to eq 2
      end

      it 'sets the status of other candidates for the vacancy to 0' do
        other_candidate = create(:candidate, vacancy: vacancy)
        patch :update, params: {
          id: vacancy.id,
          status: 2,
          candidate_id: candidate.id
        }
        candidate.reload
        other_candidate.reload
        expect(candidate.status).to eq 2
        expect(other_candidate.status).to eq 0
      end
    end

    context 'when setting status to 0' do
      it 'sets the status of the candidate to 0' do
        patch :update, params: {
          id: vacancy.id,
          status: 0,
          candidate_id: candidate.id
        }
        candidate.reload
        expect(candidate.status).to eq 0
      end
    end
  end
end
