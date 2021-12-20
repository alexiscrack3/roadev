require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "user should be created and redirected to dashboard when information is valid" do
    get sign_up_path
    user = {
      first_name: "foo",
      last_name: "bar",
      email: "user@example.com",
      password: "password",
      password_confirmation: "password"
    }
    assert_difference "User.count", 1 do
      post sign_up_path, params: { user: user }
    end

    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    # Try to log in before activation.
    log_in_as(user)
    assert_not logged_in?
    # Invalid activation token
    get edit_account_activation_path("invalid token", email: user.email)
    assert_not logged_in?
    # Valid token, wrong email
    get edit_account_activation_path(user.activation_token, email: "wrong")
    assert_not logged_in?
    # Valid activation token
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template "dashboard/index"
    assert_not flash.empty?
    assert logged_in?
  end

  test "user should not be created nor redirected to dashboard when information is not valid" do
    get sign_up_path
    user = {
      first_name: "",
      last_name: "",
      email: "user@invalid",
      password: "foo",
      password_confirmation: "bar"
    }
    assert_no_difference "User.count" do
      post sign_up_path, params: { user: user }
    end
    assert_template "sessions/sign_up"
  end
end
