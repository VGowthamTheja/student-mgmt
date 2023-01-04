# frozen_string_literal: true

# adding roles to each students.
class AddRolesColumnToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :role, :integer, default: 0
  end
end
