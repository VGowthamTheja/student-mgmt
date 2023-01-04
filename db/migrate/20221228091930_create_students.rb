# frozen_string_literal: true

# create student table
class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
