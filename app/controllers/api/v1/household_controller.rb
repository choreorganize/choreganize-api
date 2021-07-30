class Api::V1::HouseholdController < ApplicationController

  def show
    household = Household.find_by(id: params[:id])
    if household.nil?
      error = "cannot find household with id #{params[:id]}"
      error_response(error)
    else
      render json: HouseholdSerializer.new(household), status: 200
    end
  end


end
