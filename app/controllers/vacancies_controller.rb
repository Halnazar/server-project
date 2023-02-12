class VacanciesController < ApplicationController

  def index
    render json: {
      data: VacancySerializer.new(Vacancy.all).serializable_hash
    }, status: :ok
  end

  def new

  end

  def update
    v = Vacancy.find(params[:id])

    if params[:status] == 2
      ActiveRecord::Base.transaction do
        v.close!
        Candidate.where(vacancy_id: params[:id]).
          where.not(id: params[:candidate_id]).update_all(status: 0)

        Candidate.find(params[:candidate_id]).update(status: 2)
      end
    elsif params[:status] == 0
      Candidate.find(params[:candidate_id]).update(status: 0)
    end
  end

  def create
    ActiveRecord::Base.transaction do

      vacancy = Vacancy.create!({
            status: false,
            opening_date: Date.today,
            position_id: params["vacancy"]["positionId"]
        })

    end
    render json: {
      data: VacancySerializer.new(Vacancy.last).serializable_hash
    }, status: :ok

  rescue StandardError => e
    render json: {status: "error", code: 400,
                  client_message: "Please check if typed data is correct",
                  error_message: e.message}
  end


  private



end
