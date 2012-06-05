class LineItemsController < InheritedResources::Base

  def create
    @cart = current_cart
    line_item = LineItem.where("cart_id = ? and product_id = ?", @cart.id, params[:product_id]).first
    if line_item.nil?
      line_item = LineItem.create(:cart_id => @cart.id, :product_id => params[:product_id], :quantity => params[:quantity])
    else
      line_item.quantity = line_item.quantity + params[:quantity].to_i
      line_item.save!
    end

    respond_to do |format|
      format.html { render :partial => "carts/user_cart", :locals => { :cart => @cart } }
    end
  end
end
