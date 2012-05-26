class ApplicationController < ActionController::Base
  protect_from_forgery

  private
#def current_user
#     @current_user ||= current_user if user_signed_in?
#   end
#   helper_method :current_user

    def authorize
      redirect_to login_url, alert: "Not authorized" if current_user.nil?
    end

    def current_cart
      cart = nil
      if user_signed_in?
        if session[:cart_id].nil?
          cart = Cart.find_by_user_id(current_user.id)
          cart = Cart.create!(:user_id => current_user.id) if cart.nil?
          session[:cart_id] = cart.id
       else
         cart = Cart.find(session[:cart_id])
       end
      end
      cart
    end
end
