class CartsController < ApplicationController
	
   
	def index
	  @carts = current_user.carts
	end 

	def create
		Cart.create(product_id: params[:product_id], user_id: current_user.try(:id))
       	redirect_to carts_path
	end	
end