class LineItemsController < InheritedResources::Base

  def new
    @cart = current_cart
    line_item = LineItem.where("cart_id = ? and product_id = ?", @cart.id, params[:product_id])
    if line_item.nil?
      line_item = LineItem.create(:cart_id => @cart.id, :product_id => params[:product_id])
    else
      line_item.quantity = line_item.quantity + 1
      line_item.save!
    end

    session[:cart] = @cart.reload
    respond_to do |format|
      format.html { render :partial => "carts/user_cart", :locals => {:cart => @cart} }
    end
  end
end
