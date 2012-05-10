class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.text_search(params[:query])

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
end
