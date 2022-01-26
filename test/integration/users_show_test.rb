require "test_helper"

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @user_a = users(:user_a)
  end

  test "user should be redirected to sign-in page when user is not authenticated" do
    get user_path(@user_a)
    assert_not flash.empty?
    assert_redirected_to sign_in_path
  end
end
