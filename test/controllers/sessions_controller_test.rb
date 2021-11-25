require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "sign up endpoint should return response" do
    get sign_in_path
    assert_response :success
  end

  test "sign up should instantiate user" do
    get sign_up_path
    assert_not @controller.instance_variable_get(:@user).nil?
  end

  test "sign in endpoint should return response" do
    get sign_in_path
    assert_response :success
  end

  test "sign in should instantiate user" do
    get sign_in_path
    assert_not @controller.instance_variable_get(:@user).nil?
  end
end
