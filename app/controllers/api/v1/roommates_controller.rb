class Api::V1::RoommatesController < ApplicationController

  def index
    render json: User.all
  end

  def show

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
