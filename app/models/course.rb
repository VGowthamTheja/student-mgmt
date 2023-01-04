# frozen_string_literal: true

# course database modifiers.
class Course < ApplicationRecord
  include Validatable

  has_and_belongs_to_many :students # rubocop:disable Rails/HasAndBelongsToMany
end
