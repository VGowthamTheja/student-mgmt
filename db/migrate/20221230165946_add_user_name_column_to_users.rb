# frozen_string_literal: true

# adding user name to constructed users.
class AddUserNameColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_name, :string
  end
end
