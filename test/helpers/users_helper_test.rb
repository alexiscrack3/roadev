require "test_helper"

class UsersHelperTest < ActionView::TestCase

  def setup
    @user = users(:user_a)
  end

  test "gravatar should be rendered when user is not nil" do
    image_tag = gravatar_for(@user)
    assert_equal "<img alt=\"#{@user.email.downcase}\" class=\"gravatar\" src=\"https://secure.gravatar.com/avatar/c6ddb5cb7fa09b544e5bc11419bc0e90?s=80\" />", image_tag
  end

  test "gravatar should not be rendered when user is nil" do
    image_tag = gravatar_for(nil)
    assert_nil image_tag
  end
end
