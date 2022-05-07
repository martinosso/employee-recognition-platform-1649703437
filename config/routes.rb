# frozen_string_literal: true

Rails.application.routes.draw do
  resources :kudos
  root to: "kudos#index"

  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions' }
  devise_for :employees, path: 'employees'

  namespace :admins do
    resources :kudos, only: %i[index destroy]
    resources :employees, only: %i[index update edit destroy]
    root 'pages#dashboard'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
