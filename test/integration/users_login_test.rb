require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user_a)
  end

  test 'login should redirect to dashboard when email and password are valid' do
    get login_path
    assert_template 'sessions/new'
    session = {
      email: @user.email,
      password: '123456'
    }
    post login_path, params: { session: session }
    assert is_logged_in?
    assert_redirected_to dashboard_path
    follow_redirect!
    assert_template 'dashboard/index'
  end

  test 'login should redirect to login when email is valid and password is invalid' do
    get login_path
    assert_template 'sessions/new'
    session = {
      email: @user.email,
      password: 'invalid'
    }
    post login_path, params: { session: session }
    assert_not is_logged_in?
    assert_redirected_to login_path
    follow_redirect!
    assert_template 'sessions/new'
  end

  test 'login should redirect to login when email is invalid and password is valid' do
    get login_path
    assert_template 'sessions/new'
    session = {
      email: 'invalid',
      password: '123456'
    }
    post login_path, params: { session: session }
    assert_not is_logged_in?
    assert_redirected_to login_path
    follow_redirect!
    assert_template 'sessions/new'
  end
end
