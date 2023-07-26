# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_account_update_params, only: [:update]

  def new
    super
  end

  def create
    super do |resource|
      session[:user_id] = resource.id if resource&.id.present?
    end
  end


end
