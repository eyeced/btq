module RequestMacros
  include Warden::Test::Helpers
  def login_user
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_as @user, :scope => :user
    end
  end
end
