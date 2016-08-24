class CartsController < ApplicationController
	
   
	def index
	  if current_user.present?
	    @carts = current_user.carts
      elsif cookies.signed[:product_id].present? || cookies.permanent[:set_product_id].present?
      	@carts=[]
         cookies.signed[:product_id] = cookies.permanent[:set_product_id] if cookies.signed[:product_id].nil?
            cookies.signed[:product_id].split('_').each do |prod|
              single_prod = Struct.new(:product_id)
               @carts << single_prod.new(prod.to_i) 
            end 
        return @carts
     else
     
     end 	
	end 

	def create
		if current_user.present?
		  Cart.create(product_id: params[:product_id], user_id: current_user.try(:id)) 
       	else
       	 cookies.signed[:product_id] =  swaping_cookies(cookies.signed[:product_id],params[:product_id])
       	 cookies.permanent[:set_product_id] =  swaping_cookies(cookies.permanent[:set_product_id],params[:product_id]) 
       	 # temp = ""
         # if cookies.signed[:product_id] 
         #   temp <<  cookies.signed[:product_id] 
         #   temp << '_'
         # end 
         # temp <<  params[:product_id]
         # cookies.signed[:product_id] = temp 
         
         # # swaping of mainhead id
         #  test = ""
         # if cookies.permanent[:set_product_id] 
         #   test <<  cookies.permanent[:set_product_id]
         #   test << '_'
         # end 
         # test <<  params[:product_id]
         # cookies.permanent[:set_product_id] = test 

         #  set value in broser
         #  cookies.permanent[:product_id] = cookies.signed[:product_id]
        
        end 
       	redirect_to carts_path
	end	

	def swaping_cookies(get_cookie,product_id)
	  	 temp = ""
         if get_cookie 
           temp <<  get_cookie 
           temp << '_'
         end 
         temp <<  product_id
         get_cookie = temp 
        return get_cookie
	end
end