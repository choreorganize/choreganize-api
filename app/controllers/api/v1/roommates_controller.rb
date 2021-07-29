class Api::V1::RoommatesController < ApplicationController

  def index
    render json: User.all
  end

  def show

  end

  def create

  end
end
