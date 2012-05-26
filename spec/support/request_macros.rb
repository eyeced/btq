module RequestMacros
  def sign_in_user
    User.delete_all
    @user = FactoryGirl.create(:user)
    post '/users/sign_in', 'user[email]' => @user.email, 'user[password]' => @user.password
  end

  def wait_for_ajax
    wait_until { page.evaluate_script("jQuery.active") == 0 }
  end
end
