# frozen_string_literal: true

# Active application record to abstract the database.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
