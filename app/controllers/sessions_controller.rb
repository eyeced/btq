# SessionConstroller class that extends the Devise's session controller
# It sets the cart in the session for the logged in user
class SessionsController < Devise::SessionsController

  def new
    super
  end

  def create
    super
    if user_signed_in?
      session[:cart_id] = current_cart.id
    end
  end

  def destroy
    super
    session[:cart_id] = nil
  end
end
