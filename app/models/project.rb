# frozen_string_literal: true

# project database modifiers.
class Project < ApplicationRecord
  include Validatable

  has_many :student_projects, dependent: nil
  has_many :students, through: :student_projects

  def student_list
    students = Student.all
    output = []
    students.each do |student|
      output << [student.full_name, student.id]
    end
    output
  end
end
