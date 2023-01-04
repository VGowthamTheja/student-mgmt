# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :courses
  root 'welcome#index'

  resources :students do
    resources :blogs
  end
  get 'blogs/list' => 'blogs#list'
  get 'blogs/:id/screen' => 'blogs#screen', as: :blog_screen

  namespace :admin do
    resources :users
  end

  resources :student_projects
end
