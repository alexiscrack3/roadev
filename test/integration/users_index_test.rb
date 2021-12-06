require "test_helper"

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:user_a)
    @non_admin = users(:user_b)
  end

  test "users should be displayed on users page if logged in user is an admin" do
    log_in_as(@admin.email, password: "password")
    get users_path
    assert_template "users/index"
    assert_select "nav.pagination"
    first_page_of_users = User.page 1
    first_page_of_users.each do |user|
      assert_select "tr", id: "user-#{user.id}" do
        assert_select "td", text: user.first_name
        assert_select "td", text: user.last_name
        assert_select "td", text: user.email
        if user.admin
          assert_select "td", text: "Yes"
        else
          assert_select "td", text: "No"
        end
      end
    end
  end
end
