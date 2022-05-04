# frozen_string_literal: true

Rails.application.routes.draw do
  resources :kudos
  root to: "kudos#index"

  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions' }, skip: [:registrations]
  devise_for :employees, path: 'employees', controllers: { sessions: 'employees/sessions' }
  
  devise_scope :admin do
    get "/admins/sign_in" => "admins/sessions#new" # custom path to login/sign_in
  end

  namespace :admins do
    resources :kudos, only: %i[index destroy]
    root 'pages#dashboard'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
