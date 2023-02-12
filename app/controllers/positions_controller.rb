class PositionsController < ApplicationController

  def index
    render json: {
      data: PositionSerializer.new(Position.all).serializable_hash
    }, status: :ok
  end

  def create
    
  end

  private

end
