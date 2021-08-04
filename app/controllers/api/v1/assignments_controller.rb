class Api::V1::AssignmentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create

    assignment_params = { 
      completed: params['assignment']['completed'],
      roommate_id: params['assignment']['roommate_id'],
      chore_id: params['assignment']['chore_id']
    }

    assignment = Assignment.create!(assignment_params)

    if assignment.save
      render json: AssignmentSerializer.new(assignment), status: 201
    end 

    rescue ActiveRecord::RecordInvalid
      render json: {
        message: 'Bad Request',
        errors: "Cannot create assignment. Roommate must exist, Chore must exist"
      }, status: 400
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
