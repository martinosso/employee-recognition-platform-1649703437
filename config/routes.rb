# frozen_string_literal: true

Rails.application.routes.draw do
  resources :kudos
  root to: "kudos#index"

  devise_for :admins, path: 'admins'
  devise_for :employees, path: 'employees'

  namespace :admins do
    resources :kudos, only: %i[index show destroy]
    resources :employees, only: %i[index show update edit destroy]
    root to: 'pages#dashboard', as: :root
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
