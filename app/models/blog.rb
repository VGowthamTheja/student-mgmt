# frozen_string_literal: true

# blog database modifiers.
class Blog < ApplicationRecord
  belongs_to :student
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true, length: 10..1000

  accepts_nested_attributes_for :student

  def blog_owner
    self.student.full_name if self.student.present?
  end

  def student_pointer
    self.student if self.student.present?
  end
end
