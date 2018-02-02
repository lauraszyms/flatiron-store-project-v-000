class CartsController < ApplicationController

  def show
   @current_cart = Cart.find_by(:id => params[:id])
  end

  def index
  end

  def checkout
   @current_cart = Cart.find(params[:id])
   @current_cart.items.each.with_index do |item, i|
     item.inventory -= @current_cart.line_items[i].quantity
     item.save
   end
   @current_cart.update(status: "Submitted")
   current_user.update(current_cart: nil)
  #  binding.pry
   redirect_to cart_path(@current_cart)
 end

end
