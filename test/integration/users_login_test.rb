require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user_a)
  end

  test 'login should redirect to dashboard when email and password are valid' do
    get users_sign_in_path
    assert_template 'sessions/sign_in'
    session = {
      email: @user.email,
      password: '123456'
    }
    post users_sign_in_path, params: { session: session }
    assert is_logged_in?
    assert_redirected_to dashboard_path
    follow_redirect!
    assert_template 'dashboard/index'
  end

  test 'login should redirect to login when email is valid and password is invalid' do
    get users_sign_in_path
    assert_template 'sessions/sign_in'
    session = {
      email: @user.email,
      password: 'invalid'
    }
    post users_sign_in_path, params: { session: session }
    assert_not is_logged_in?
    assert_redirected_to users_sign_in_path
    follow_redirect!
    assert_template 'sessions/sign_in'
  end

  test 'login should redirect to login when email is invalid and password is valid' do
    get users_sign_in_path
    assert_template 'sessions/sign_in'
    session = {
      email: 'invalid',
      password: '123456'
    }
    post users_sign_in_path, params: { session: session }
    assert_not is_logged_in?
    assert_redirected_to users_sign_in_path
    follow_redirect!
    assert_template 'sessions/sign_in'
  end
end
