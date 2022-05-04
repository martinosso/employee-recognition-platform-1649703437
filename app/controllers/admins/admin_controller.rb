module Admins
  class AdminController < ApplicationController
    before_action :authenticate_admin!
    layout 'admins'
  end
end
