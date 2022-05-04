# frozen_string_literal: true

class ApplicationController < ActionController::Base

    def check_logged_in
        if !current_employee and !current_admin
            authenticate_employee!
        end
    end
end
