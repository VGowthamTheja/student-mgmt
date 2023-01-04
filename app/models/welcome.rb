# frozen_string_literal: true

# model for welcome landing page.
class Welcome < ApplicationRecord
  def user_name(user)
    Student.find_by(email: user).full_name
  end
end
