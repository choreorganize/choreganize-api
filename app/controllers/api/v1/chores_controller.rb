class Api::V1::ChoresController < ApplicationController

  def index
    chores = Chore.all
    render json: ChoresSerializer.new(chores)
  end

  def show
    chore = Chore.find(params[:id])
    render json: ChoresSerializer.new(chore), status: 200

  rescue ActiveRecord::RecordNotFound
    render json: {
      message: 'Not Found',
      errors: ["Could not find chore with id##{params[:id]}"]
    }, status: :not_found

  end

  def create

  end

  def edit

  end
end
