# frozen_string_literal: true

# to validate some common grounds.
module Validatable
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true, length: 10..1000
    scope :current_month, -> { where(created_at: Time.zone.today.beginning_of_month...Time.zone.today.end_of_month) }
  end
end
