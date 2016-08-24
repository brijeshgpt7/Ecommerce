module ApplicationHelper
	def product_title(cart)
		Product.find_by_id(cart.product_id).title
	end 

	def product_description(cart)
		Product.find_by_id(cart.product_id).description
	end 

	def product_price(cart)
		Product.find_by_id(cart.product_id).price
	end 
	def product_avatar(cart)
		Product.find_by_id(cart.product_id).avatar.url(:medium)
	end 

end
