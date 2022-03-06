require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user_a)
    @other_user = users(:user_b)
  end

  test "user should be redirected to login page when navigating to users page and logged in" do
    get users_path
    assert_not flash.empty?
    assert_redirected_to sign_in_path
  end

  test "user should be updated when logged in" do
    log_in_as(@user.email, password: "password")
    get user_path(@user)
    user = {
      first_name: "first name",
      last_name: "last name",
      linked_in: "linkedin"
    }
    patch user_path(@user), params: { user: user }
    assert_not flash.empty?
    assert_redirected_to user_path(@user)
  end

  test "user should be redirected to login page when updating user's info and not logged in" do
    user = {
      first_name: "new"
    }
    patch user_path(@user), params: { user: user }
    assert_not flash.empty?
    assert_redirected_to sign_in_path
  end

  # test "user should be redirected to index page when editing other user's info and logged in as wrong user" do
  #   log_in_as(@other_user.email, password: "password")
  #   get edit_user_path(@user)
  #   assert flash.empty?
  #   assert_redirected_to root_url
  # end

  test "user should be redirected to index page when updating other user's info and logged in as wrong user" do
    log_in_as(@other_user.email, password: "password")
    user = {
      first_name: "new"
    }
    patch user_path(@user), params: { user: user }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "user should not be allowed to edit the admin attribute" do
    log_in_as(@other_user.email, password: "password")
    assert_not @other_user.admin?
    user = {
      admin: true
    }
    patch user_path(@user), params: { user: user }
    assert_not @other_user.admin?
  end
end
