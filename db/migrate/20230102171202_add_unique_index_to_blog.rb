# frozen_string_literal: true

# adding unique index for uniqueness validation to blog table.
class AddUniqueIndexToBlog < ActiveRecord::Migration[7.0]
  def change
    add_index :blogs, :title, unique: true
  end
end
