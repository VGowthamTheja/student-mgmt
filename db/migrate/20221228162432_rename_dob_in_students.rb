# frozen_string_literal: true

# rename column in students table.
class RenameDobInStudents < ActiveRecord::Migration[7.0]
  def change
    rename_column :students, :dob, :date_of_birth
  end
end
