require 'spec_helper'
require 'capybara_helper'

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
    find_by_id('quantity')
    page.select('2', :from => 'quantity')
    cart_items_before = find_by_id('cart').find('a').text.scan(/\d/)[0].to_i
    click_link "add_to_cart"
    wait_until_ajax_done
    cart_items_after = find_by_id('cart').find('a').text.scan(/\d/)[0].to_i
    item_added = cart_items_after - cart_items_before
    item_added.should eql(2)
  end
end
