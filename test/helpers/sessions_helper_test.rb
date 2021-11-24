require "test_helper"

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:user_a)
  end

  test "user should be logged in when session is not nil" do
    log_in(@user)
    assert logged_in?
  end

  test "user should be not logged in when session is nil" do
    assert_not logged_in?
  end

  test "current_user should return correct user when session is nil" do
    remember(@user)
    assert_equal @user, current_user
    assert logged_in?
  end

  test "current_user should return nil when remember digest is wrong" do
    remember(@user)
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end
