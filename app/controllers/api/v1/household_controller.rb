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
    search = {}
    params[:search_terms].each do |pair|
      search[pair[0]] = pair[1]
    end

    # search = {address: params[:search_terms][:address], city: params[:search_terms][:city], state: params[:search_terms][:state]}
    household = Household.find_by(search)

    if household.nil?
      error = "cannot find household with address '#{params[:address]} #{params[:city]} #{params[:state]}'"
      error_response(error)
    else
      render json: HouseholdSerializer.new(household), status: 200
    end
  end
end
