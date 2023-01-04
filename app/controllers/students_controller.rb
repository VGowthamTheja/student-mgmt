# frozen_string_literal: true

# Students controller.
class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]

  helper_method :formatted_date

  def index
    @students = Student.all
  end

  def show; end

  def new
    @student = Student.new
  end

  def edit; end

  def create
    @student = Student.new(student_params)

    if @student.save
      User.create(email: @student.email, user_name: @student.full_name, password: 'softsuave',
                  password_confirmation: 'softsuave')
      redirect_to students_path, notice: I18n.t('student_create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @student.update(student_params)
      redirect_to student_path(@student), notice: I18n.t('student_update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by(email: @student.email)
    if @user.destroy
      @student.destroy
    else
      raise ActiveRecord::RecordNotDestroyed, @student.errors.full_messages
    end
    redirect_to students_path, notice: I18n.t('student_destroy')
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :date_of_birth, :permanent_address,
                                    :local_address, :permanent_contact_number, :alternate_contact_number)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def formatted_date(date)
    if date.present?
      date.strftime('%A, %b %d, %Y') if date.present?
    else
      'N/A'
    end
  end
end
