require "test_helper"

class UsersSigninTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user_a)
  end

  test 'user should be redirected to dashboard when email and password are valid' do
    get users_sign_in_path
    assert_template 'sessions/sign_in'
    session = {
      email: @user.email,
      password: 'password'
    }
    post users_sign_in_path, params: { session: session }
    assert is_logged_in?
    assert_redirected_to dashboard_path
    follow_redirect!
    assert_template 'dashboard/index'
  end

  test 'user should be redirected to login when email is valid and password is invalid' do
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

  test 'user should be redirected to login when email is invalid and password is valid' do
    get users_sign_in_path
    assert_template 'sessions/sign_in'
    session = {
      email: 'invalid',
      password: 'password'
    }
    post users_sign_in_path, params: { session: session }
    assert_not is_logged_in?
    assert_redirected_to users_sign_in_path
    follow_redirect!
    assert_template 'sessions/sign_in'
  end
end
