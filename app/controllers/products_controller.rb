class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.text_search(params[:query]).page(params[:page]).per_page(16)

    @categories = Category.where('parent_id is null')
    @trends = Trend.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  def quantity
    @product_item = ProductItem.where("product_id = ? and size = ?", params[:product_id], params[:size]).first
    respond_to do |format|
      format.html { render :partial => "products/quantity", :locals => { :product_item => @product_item } }
    end
  end
end
