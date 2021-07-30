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

  def search

    # 
    # household = Household.find_by(address: params[:address], city: params[:city], state: params[:state])
    # if household.nil?
    #   error = "cannot find household with address '#{params[:address]+ params[:city] + params[:state]}'"
    #   error_response(error)
    # else
    #   render json: HouseholdSerializer.new(household), status: 200
    # end
  end


end
