class Admin::BaseController < ApplicationController

  before_action :require_login

  def require_login
    unless current_user&.has_role? :admin
      flash[:danger] = "You must be logged in to access this."
      redirect_to new_customer_session_path
    end
  end
end
