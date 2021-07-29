class Api::V1::RoommatesController < ApplicationController

  def index
    roommates = Roommate.all
    render json: RoommatesSerializer.new(roommates)
  end

  def show

  end

  def create

  end
end
