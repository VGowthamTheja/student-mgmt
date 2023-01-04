# frozen_string_literal: true

# adding unique index for uniqueness validation to students table.
class AddUniqueIndexToStudents < ActiveRecord::Migration[7.0]
  def change
    add_index :students, :email, unique: true
  end
end
