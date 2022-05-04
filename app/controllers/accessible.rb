module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected

  def check_user
    if current_admin
      flash.clear
      flash.notice = 'Signed in as admin successfully.'
      redirect_to(admins_root_path) and return
    elsif current_employee
      flash.clear
      flash.notice = 'Signed in successfully.'
      redirect_to(kudos_path) and return
    end
  end
end
