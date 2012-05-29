module RequestMacros
  def login_user
    include Warden::Test::Helpers
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_as @user, :scope => :user
    end
  end
end
