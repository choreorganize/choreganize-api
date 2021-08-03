class Api::V1::AssignmentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    assignment = Assignment.new(assignment_params)

    if assignment.save
      render json: AssignmentSerializer.new(assignment), status: 201
    else
      # test = assignment.errors
      # binding.pry
      error_response("cannot create assignment", 400)
    end
  end

  private
    def assignment_params
      params.require(:assignment).permit(:completed, :roommate_id, :chore_id)
    end
end
