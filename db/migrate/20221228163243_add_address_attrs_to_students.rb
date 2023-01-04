# frozen_string_literal: true

# add new addresses to students table.
class AddAddressAttrsToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :local_address, :string
    add_column :students, :permanent_address, :string
  end
end
