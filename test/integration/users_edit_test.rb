require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user_a)
  end

  # test "user should be successful edit with friendly forwarding" do
  #   get edit_user_path(@user)
  #   log_in_as(@user)
  #   assert_redirected_to edit_user_url(@user)
  #   name = "Foo Bar"
  #   email = "foo@bar.com"
  #   user = {
  #     name: name,
  #     email: email,
  #     password: "",
  #     password_confirmation: ""
  #   }
  #   patch user_path(@user), params: { user: user }
  #   assert_not flash.empty?
  #   assert_redirected_to @user
  #   @user.reload
  #   assert_equal name,  @user.name
  #   assert_equal email, @user.email
  # end

  test "user should be redirected to profile when user info is valid" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template "users/edit"
    user = {
      first_name: "Foo",
      last_name: "Bar"
    }
    patch user_path(@user), params: { user: user }
    follow_redirect!
    assert_template "users/show"
    assert_not flash.empty?
  end

  test "user should be sent back to edit page when user info is not valid" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template "users/edit"
    user = {
      first_name: nil,
      last_name: nil
    }
    patch user_path(@user), params: { user: user }
    assert_template "users/edit"
  end
end
