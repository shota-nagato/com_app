class Admin::ApplicationController < ActionController::Base
  before_action :authenticate_admin

  layout "admin/application"

  def authenticate_admin
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end
end
