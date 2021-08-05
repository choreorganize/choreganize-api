class Api::V1::RoommatesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update]

  def index
    roommates = Roommate.all
    render json: RoommateSerializer.new(roommates)
  end

  def show
    user = Roommate.find(params[:id])
    render json: RoommateSerializer.new(user), status: 200

  rescue ActiveRecord::RecordNotFound
    render json: {
      message: 'Not Found',
      errors: ["Could not find user with id##{params[:id]}"]
    }, status: 404
  end

  def create
    roommate = Roommate.new(roommate_params)
    if roommate.save
      render json: RoommateSerializer.new(roommate), status: 201
    else
      render json: roommate.errors, status: 422
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

  def update
    roommate = Roommate.find(params[:id])

    if roommate.update(roommate_params)
      render json: RoommateSerializer.new(roommate), status: 204
    end

  rescue ActiveRecord::RecordNotFound
    render json: {
      message: 'Not Found',
      errors: ["Could not find roommate with id##{params[:id]}"]
    }, status: 404

  end

  private
    def roommate_params
      params.require(:roommate).permit(:name, :email, :google_id, :token, :household_id)
    end
end
