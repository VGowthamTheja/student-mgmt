# frozen_string_literal: true

# updating students table.
class UpdateContactAttrsToStudents < ActiveRecord::Migration[7.0]
  def change
    rename_column :students, :contact, :permanent_contact_number
    add_column :students, :alternate_contact_number, :string
  end
end
