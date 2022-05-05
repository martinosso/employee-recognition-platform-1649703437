# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def check_logged_in
    authenticate_employee! if !current_employee && !current_admin
  end
end
