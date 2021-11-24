require "test_helper"

class UsersSigninTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user_a)
  end

  test "user should be redirected to dashboard when email and password are valid" do
    get users_sign_in_path
    assert_template "sessions/sign_in"
    session = {
      email: @user.email,
      password: "password"
    }
    post users_sign_in_path, params: { session: session }
    assert logged_in?
    assert_redirected_to dashboard_path
    follow_redirect!
    assert_template "dashboard/index"
    assert flash.empty?
  end

  test "user should be redirected to login when email is valid and password is invalid" do
    get users_sign_in_path
    assert_template "sessions/sign_in"
    session = {
      email: @user.email,
      password: "invalid"
    }
    post users_sign_in_path, params: { session: session }
    assert_not logged_in?
    assert_template "sessions/sign_in"
    assert_not flash.empty?
  end

  test "user should be redirected to login when email is invalid and password is valid" do
    get users_sign_in_path
    assert_template "sessions/sign_in"
    session = {
      email: "invalid",
      password: "password"
    }
    post users_sign_in_path, params: { session: session }
    assert_not logged_in?
    assert_template "sessions/sign_in"
    assert_not flash.empty?
  end

  test "user should be signed out after " do
    get users_sign_in_path
    assert_template "sessions/sign_in"
    session = {
      email: @user.email,
      password: "password"
    }
    post users_sign_in_path, params: { session: session }
    assert logged_in?
    assert_redirected_to dashboard_path
    follow_redirect!
    assert_template "dashboard/index"
    assert flash.empty?
    assert_select "a[href=?]", users_sign_in_path, count: 0
    assert_select "a[href=?]", users_sign_up_path, count: 0
    assert_select "a[href=?]", users_sign_out_path
    # assert_select "a[href=?]", user_path(@user)
    delete users_sign_out_path
    assert_not logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", users_sign_in_path
    assert_select "a[href=?]", users_sign_up_path
    assert_select "a[href=?]", users_sign_out_path,      count: 0
    # assert_select "a[href=?]", user_path(@user), count: 0
  end
end
