class Api::V1::AssignmentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    assignment = Assignment.new(assignment_params)
    if assignment.save
      render json: AssignmentSerializer.new(assignment), status: 201
    else
      error_response("cannot create assignment", 400)
    end
  end

  def update
    assignment = Assignment.find(params[:id])

    if assignment.update!(assignment_params)
      render json: AssignmentSerializer.new(assignment), status: 204
    end

  rescue ActiveRecord::RecordNotFound
    render json: {
      message: 'Not Found',
      errors: "Could not find assignment with id##{params[:id]}"
    }, status: 404
  end

  private
    def assignment_params
      params.require(:assignment).permit(:completed, :roommate_id, :chore_id)
    end
end
