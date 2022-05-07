# frozen_string_literal: true

module Admins
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]
    def after_sign_in_path_for(_resource)
      admins_root_path
    end
  end
end
