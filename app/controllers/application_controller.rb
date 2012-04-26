class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def authorize
      redirect_to login_url, alert: "Not authorized" if current_user.nil?
    end

    def current_cart
      cart = nil
      if session[:cart].nil?
        cart = Cart.create!(:user_id => session[:user_id])
        session[:cart] = cart
      else
        cart = session[:cart]
      end
      cart
    end
end
