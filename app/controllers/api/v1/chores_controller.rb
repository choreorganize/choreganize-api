class Api::V1::ChoresController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    chores = Chore.all
    render json: ChoreSerializer.new(chores)
  end

  def show
    chore = Chore.find(params[:id])
    render json: ChoreSerializer.new(chore), status: 200

  rescue ActiveRecord::RecordNotFound
    render json: {
      message: 'Not Found',
      errors: ["Could not find chore with id##{params[:id]}"]
    }, status: :not_found
  end

  def create
    chore = Chore.new(chore_params)

    if chore.save
      render json: ChoreSerializer.new(chore), status: 201
    else
      render json: {
      message: 'Invalid',
      errors: chore.errors.map { |_attr, msg| msg }
    }, status: 422
    end
  end

  def update
    chore = Chore.find(params[:id])

    if chore.update!(chore_params)
      render json: ChoreSerializer.new(chore), status: 204
    end

  rescue ActiveRecord::RecordNotFound
    render json: {
      message: 'Not Found',
      errors: "Could not find chore with id##{params[:id]}"
    }, status: 404
  end

  private
    def chore_params
      params.require(:chore).permit(:task_name, :weight, :frequency, :household_id, :description, :outdoor)
    end
end
