class CandidatesController < ApplicationController

  def index
    render json: {
      data: CandidateSerializer.new(Candidate.all).serializable_hash
    }, status: :ok
  end

  def update
        unless params[:reject_it].nil?
            c = Candidate.find(params[:id])
            c.status = 0
            c.save
        else
          c = Candidate.find(params[:id])
          c.status = 2
          c.save

          c.vacancy.closing_date = Date.today
          c.vacancy.status = true
          c.vacancy.save

          c.vacancy.candidates.each do |cand|
            unless cand.status == 2
                cand.status = 0
                cand.save
            end
          end
        end

        respond_to do |format|
            format.js {render inline: "location.reload();" }
          end
  end


  def create
    ActiveRecord::Base.transaction do
      candidate = Candidate.create!({
           first_name: params["candidate"]["firstName"],
           second_name: params["candidate"]["secondName"],
           email: params["candidate"]["email"],
           number: params["candidate"]["number"],
           expirience_years: params["candidate"]["expYears"].to_f,
           biography: params["candidate"]["bio"],
           vacancy_id: params["candidate"]["vacancyId"],
           status: 1,
           user_id: params["candidate"]["currentUserId"],
           gender: params["candidate"]["gender"]=="1",
       })

      params["candidate"]["scores"].each do |k,v|
        CandidateCriteriumScore.create(
          {
            criterium_id: k,
            candidate_id: candidate.id,
            score: v
          })
      end
    end
    render json: {
      data: CandidateSerializer.new(Candidate.last).serializable_hash
    }, status: :ok

    rescue StandardError => e
      render json: {status: "error", code: 400,
                    client_message: "Please check if typed data is correct",
                    error_message: e.message}
  end






end
