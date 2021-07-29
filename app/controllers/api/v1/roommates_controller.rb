class Api::V1::RoommatesController < ApplicationController

  def index
    roommates = Roommate.all
    render json: RoommatesSerializer.new(roommates)
  end

  def show
    user = Roommate.find(params[:id])
    render json: RoommatesSerializer.new(user), status: 200

  rescue ActiveRecord::RecordNotFound
    render json: {
      message: 'Not Found',
      errors: ["Could not find user with id##{params[:id]}"]
    }, status: :not_found
  end

  def create
    # require 'pry'; binding.pry
    roommate = Roommate.new(roommate_params)

    if roommate.save
      render json: roommate, status: :created
    else
      render json: roommate.errors, status: :unprocessable_entity
    end
  end

  private

  def roommate_params
    params.require(:roommate).permit(:name, :email, :google_id, :token)
  end
end
