class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    if @category.parent.nil?
      @products = Product.where("category_id in (select id from categories where parent_id = ?)", params[:id]).page(params[:page]).per(16)
    else
      @products = Product.where("category_id = ?", @category.id).page(params[:page]).per(16)
    end
  end
end
