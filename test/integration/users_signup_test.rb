require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "user should be created and redirected to dashboard when information is valid" do
    get users_sign_up_path
    user = {
      first_name: "foo",
      last_name: "bar",
      email: "user@example.com",
      password: "password",
      password_confirmation: "password"
    }
    assert_difference "User.count", 1 do
      post users_sign_up_path, params: { user: user }
    end
    follow_redirect!
    assert_template "dashboard/index"
    assert_not flash.empty?
  end

  test "user should not be created nor redirected to dashboard when information is not valid" do
    get users_sign_up_path
    user = {
      first_name: "",
      last_name: "",
      email: "user@invalid",
      password: "foo",
      password_confirmation: "bar"
    }
    assert_no_difference "User.count" do
      post users_sign_up_path, params: { user: user }
    end
    assert_template "sessions/sign_up"
  end
end
