class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  helper_method :check_admin?, :get_cart_value
  
  #check admin user or end user
  def check_admin?
    current_user.user_id == "admin" if current_user.present?
  end
  # cart count 
  def get_cart_value
    if current_user
      return current_user.carts.count
    else
      return 0
    end 
  end	
end
