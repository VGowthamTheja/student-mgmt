# frozen_string_literal: true

# student table modifiers.
class Student < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_and_belongs_to_many :courses # rubocop:disable Rails/HasAndBelongsToMany
  has_many :student_projects, dependent: nil
  has_many :projects, through: :student_projects

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, :last_name, length: { minimum: 2, maximum: 50 }
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: I18n.t('.format_message') }

  validate :validate_student_age

  enum role: { user: 0, manager: 1, admin: 2 }

  after_save :display_student_age

  def display_student_age
    if date_of_birth.present?
      age = Time.zone.today.year - date_of_birth.year
      Rails.logger.debug { "============Age of the student is #{age}============" }
    else
      Rails.logger.debug '============Age of the student is unknown============'
    end
  end

  def validate_student_age
    return if date_of_birth.blank?

    age = Time.zone.today.year - date_of_birth.year
    return unless age < 15

    errors.add(:age, 'please provide a valid date of birth. Age must be greater than 15.')
  end

  def full_name
    "#{first_name} #{last_name}".capitalize
  end

  def age
    return 'N/A' if date_of_birth.blank?

    Time.zone.today.year - date_of_birth.year
  end

  def submit_by
    StudentProject.find_by(student_id: id).submission_date.inspect
  end
end
