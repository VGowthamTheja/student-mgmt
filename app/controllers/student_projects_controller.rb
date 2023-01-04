# frozen_string_literal: true

# students_projects join association controller.
class StudentProjectsController < ApplicationController
  def index; end

  def new
    @student_project = StudentProject.new
  end

  def create
    @student_project = StudentProject.new(student_project_params)
    if @student_project.save
      redirect_to project_path(@student_project.project_id)
    else
      render '/projects', status: :unprocessable_entity
    end
  end

  private

  def student_project_params
    params.permit(:student_id, :project_id, :submission_date)
  end
end
