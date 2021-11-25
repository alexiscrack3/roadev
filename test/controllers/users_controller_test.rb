require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_path users(:user_a)
    assert_response :success
  end
end
