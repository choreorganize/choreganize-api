class Api::V1::HouseholdController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

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
    search = {}
    params[:search_terms].each do |pair|
      search[pair[0]] = pair[1]
    end
    household = Household.find_by(search)
    if household.nil?
      error = "cannot find household with address '#{params[:address]} #{params[:city]} #{params[:state]}'"
      error_response(error)
    else
      render json: HouseholdSerializer.new(household), status: 200
    end
  end

  def create
    household = Household.new(household_params)

  if household.save
    render json: HouseholdSerializer.new(household), status: 201
  else
    # test = household.errors
    # binding.pry
    error_response("cannot create household", 400)
  end
end


private
  def household_params
    params.require(:household).permit(:city, :state, :address, :password, :password_confirmation)
  end
end
