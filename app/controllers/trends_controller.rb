class TrendsController < InheritedResources::Base

  def show
    @trends = Trend.where("start < ? and 'end' > ?", Time.now, Time.now).order("start desc")
    @products = Product.find_by_trend(params[:id]).page(params[:page]).per_page(16)
    super
  end
end
