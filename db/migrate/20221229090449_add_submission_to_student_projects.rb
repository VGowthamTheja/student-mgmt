# frozen_string_literal: true

# add a submission date to studentproject join table.
class AddSubmissionToStudentProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :student_projects, :submission_date, :date
  end
end
