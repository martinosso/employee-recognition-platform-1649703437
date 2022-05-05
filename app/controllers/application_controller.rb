# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    admins_root_path if current_admin
    kudos_path if current_employee
  end

  def check_logged_in
    authenticate_employee! if !current_employee && !current_admin
  end
end
