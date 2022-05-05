# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if current_admin
      admins_root_path
    end
  end
  def check_logged_in
    authenticate_employee! if !current_employee && !current_admin
  end
end
