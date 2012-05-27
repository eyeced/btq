require 'spec_helper'

include Warden::Test::Helpers
describe "ShowProduct" do
  login_user

  before(:each) do
    @product = FactoryGirl.create(:product)
    visit product_path(@product)
  end

  it "should show Cart on the page" do
    page.should have_content("Cart (")
  end

  it "should have add to cart button" do
    page.should have_content("Add to Cart")
    page.should have_content("Choose Size")
  end

  it "should show quantity when user selects a size", :js => true do
    page.select('small', :from => 'product_size')
    find_by_id('quantity')
  end

  it "should increase cart num when product is added", :js => true do
    page.select('small', :from => 'product_size')
    cart_text_before = find_by_id('cart').find('a').text
    click_link "add_to_cart"
    cart_text_after = find_by_id('cart').find('a').text
    cart_text_before.should_not equal(cart_text_after)
  end
end
