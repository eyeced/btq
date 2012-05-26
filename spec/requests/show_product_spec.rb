require 'spec_helper'

include Warden::Test::Helpers
describe "ShowProduct" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as @user, :scope => :user
  end

  it "should have add to cart button" do
    @product = FactoryGirl.create(:product)
    visit product_path(@product)
    page.should have_content("Add to Cart")
    page.should have_content("Choose Size")
  end

  it "should show quantity when user selects a size" do
    @product = FactoryGirl.create(:product)
    visit products_path(@product)
    select('small', :from => 'product_size')
#    wait_until { page.evaluate_script("jQuery.active") == 0 }
    find_by_id('quantity')
  end
end
