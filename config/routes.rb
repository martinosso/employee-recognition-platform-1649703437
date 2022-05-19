# frozen_string_literal: true

Rails.application.routes.draw do
  resources :kudos
  root to: "kudos#index"

  devise_for :admins, path: 'admins'
  devise_for :employees, path: 'employees'

  namespace :admins do
    resources :kudos, only: %i[index show destroy]
    resources :employees, only: %i[index show update edit destroy]
    resources :company_values
    root to: 'pages#dashboard', as: :root
  end
end
