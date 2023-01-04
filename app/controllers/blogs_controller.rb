# frozen_string_literal: true

# blogs controller
class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]

  def index
    @blogs = Blog.includes(:student)
  end

  def show
    @student = @blog.student
  end

  def new
    @student = Student.find(params[:student_id])
    @blog = Blog.new
    @blog.build_student
  end

  def edit
    
    @student = Student.find(params[:student_id])
  end

  def create
    begin
      @student = Student.find(params[:student_id])
      @blog = Blog.find_or_create_by(title: params[:blog][:title])
      if @blog.id.nil?
        @blog.content = params[:blog][:content]
        @blog.student_id = params[:student_id]
        @blog.save
        if @blog.id.nil?
          raise ActiveRecord::Rollback, @blog.errors.full_messages
        else
          redirect_to student_path(@student), notice: I18n.t('blog_create')
        end
      else
        @blog.update(blog_params)
        redirect_to student_blog_path(@student, @blog), notice: I18n.t('blog_update')
      end
    rescue ActiveRecord::Rollback => exception
      render :new, alert: exception.message, status: :unprocessable_entity
    end

  end

  def update
    
    begin
      @student = Student.find(params[:student_id])
      if @blog.update(blog_params)
        redirect_to student_blog_path(@student, @blog), notice: I18n.t('blog_update')
      else
        raise ActiveRecord::Rollback, @blog.errors.full_messages
      end
    rescue ActiveRecord::Rollback => exception
      render :edit, alert: exception.message, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:student_id])
    @blog.destroy
    redirect_to student_path(@student), alert: I18n.t('blog_destroy')
  end

  def list
    @blogs = Blog.includes(:student)
  end

  def screen
    @blog = Blog.find(params[:id])
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
