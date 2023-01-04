# frozen_string_literal: true

# dummy demo.
class Demo < ApplicationRecord
  include Validatable

  has_one :sub_demo

  before_create :greeting_message

  def greeting_message
    Rails.logger.debug 'Hello, running before creation...!'
  end
end
