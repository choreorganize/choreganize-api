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
    roommate = Roommate.new(roommate_params)
    if roommate.save
      render json: RoommatesSerializer.new(roommate), status: :created
    else
      render json: roommate.errors, status: :unprocessable_entity
    end
    # roommate.save!<~~~~~needs the bang?
    # render json: RoommatesSerializer.new(roommate), status: :created
    # rescue ActiveRecord::RecordNotSaved
    #   render json: {
    #     message: 'Could not save',
    #     errors: ['Request reqires: name, email, google_id, and token']
    #   }, status: :unprocessable_entity
    # ^^^^this doesn't work yet.
  end

  private

  def roommate_params
    params.require(:roommate).permit(:name, :email, :google_id, :token)
  end
end
