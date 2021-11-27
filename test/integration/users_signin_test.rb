require "test_helper"

class UsersSigninTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user_a)
  end

  test "user should be redirected to dashboard when email and password are valid" do
    get sign_in_path
    assert_template "sessions/sign_in"
    log_in_as(@user.email, password: "password")
    assert logged_in?
    assert_redirected_to dashboard_path
    follow_redirect!
    assert_template "dashboard/index"
    assert flash.empty?
  end

  test "user should be redirected to login when email is valid and password is invalid" do
    get sign_in_path
    assert_template "sessions/sign_in"
    log_in_as(@user.email, password: "invalid")
    assert_not logged_in?
    assert_template "sessions/sign_in"
    assert_not flash.empty?
  end

  test "user should be redirected to login when email is invalid and password is valid" do
    get sign_in_path
    assert_template "sessions/sign_in"
    log_in_as("invalid", password: "password")
    assert_not logged_in?
    assert_template "sessions/sign_in"
    assert_not flash.empty?
  end

  test "user should be redirected to root after signing out" do
    get sign_in_path
    assert_template "sessions/sign_in"
    log_in_as(@user.email, password: "password")
    assert logged_in?
    assert_redirected_to dashboard_path
    follow_redirect!
    assert_template "dashboard/index"
    assert flash.empty?
    assert_select "a[href=?]", sign_in_path, count: 0
    assert_select "a[href=?]", sign_up_path, count: 0
    assert_select "a[href=?]", sign_out_path
    assert_select "a[href=?]", user_path(@user)
    delete sign_out_path
    assert_not logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", sign_in_path
    assert_select "a[href=?]", sign_up_path
    assert_select "a[href=?]", sign_out_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

  test "user id and token should be stored in cookie when remember_me option is enabled" do
    log_in_as(@user.email, remember_me: "1")
    assert_not cookies[:user_id].blank?
    assert_not cookies[:remember_token].blank?
  end

  test "user id and token should not be stored in cookie when remember_me option is disabled" do
    # Log in to set the cookie.
    log_in_as(@user.email, remember_me: "1")
    # Log in again and verify that the cookie is deleted.
    log_in_as(@user.email, remember_me: "0")
    assert cookies[:user_id].blank?
    assert cookies[:remember_token].blank?
  end
end
