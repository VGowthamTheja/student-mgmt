# frozen_string_literal: true

# change column type in demos table.
class ChangeTypeOfColumnInDemos < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        change_column :demos, :description, :text
      end

      dir.down do
        change_column :demos, :description, :string
      end
    end
  end
end
