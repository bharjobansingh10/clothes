
class SessionsController < Devise::SessionsController
  def create
    user = Customer.find_for_authentication(email: params[:customer][:email])

    if user && user.valid_password?(params[:customer][:password])
      sign_in(:customer, user)
      session[:user_id] = user.id
      if user.has_role? :admin
        redirect_to admin_products_path
      else
        redirect_to products_path
      end
    else
      flash[:alert] = "Invalid email or password"
      # render :new
    end
  end
end
