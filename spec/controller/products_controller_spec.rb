require 'spec_helper'
include Warden::Test::Helpers

describe ProductsController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as @user, :scope => :user
  end

  it "should have add to cart button" do
  end

end
