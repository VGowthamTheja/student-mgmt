# frozen_string_literal: true

module Admin
  # adding admin previlages.
  class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def edit
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)
      begin
        @user.save
        redirect_to admin_users_path, notice: I18n.t('admin_user_create')
      rescue => exception
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @user = User.find(params[:id])
      begin
        @user.update(update_params)
        redirect_to admin_users_path, notice: I18n.t('admin_user_update')
      rescue => exception
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: I18n.t('admin_user_destroy')
    end

    private

    def user_params
      params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
    end

    def update_params
      params.require(:user).permit(:role)
    end
  end
end
