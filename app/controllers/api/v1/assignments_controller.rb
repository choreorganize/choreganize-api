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

  private
    def assignment_params
      params.require(:assignment).permit(:completed, :roommate_id, :chore_id)
    end
end
