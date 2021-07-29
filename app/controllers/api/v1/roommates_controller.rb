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

  end
end
