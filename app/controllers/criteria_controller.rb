class CriteriaController < ApplicationController

  def index
    render json: {
      data: CriteriumSerializer.new(Criterium.all).serializable_hash
    }, status: :ok
  end

  def create
    Criterium.create!(name: params[:criterium_name])

      respond_to do |format|
          format.js {render inline: "location.reload();" }
        end
  end

  private


end
