class Api::V1::HouseholdController < ApplicationController



  def show
    household = Household.find(params[:id])
    render json: HouseholdSerializer.new(household), status: 200
  end


end
