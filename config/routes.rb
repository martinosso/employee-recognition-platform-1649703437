# frozen_string_literal: true

Rails.application.routes.draw do
  resources :kudos
  devise_for :employees, path: 'employees', controllers: { sessions: 'employees/sessions' }

  devise_scope :admin do
    get "/admins" => "admins/sessions#new" # custom path to login/sign_in
    get "/kudos" => "admins/pages#dashboard", :as => 'dashboard_admin_page'
  end
  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions' }, skip: [:registrations]
  as :admin do 
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    # put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
  end
  root to: "kudos#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
