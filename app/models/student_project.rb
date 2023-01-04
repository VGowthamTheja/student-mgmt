# frozen_string_literal: true

# join table modifiers.
class StudentProject < ApplicationRecord
  belongs_to :student
  belongs_to :project
end
