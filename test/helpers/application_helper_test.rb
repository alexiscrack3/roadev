require "test_helper"

class ApplicationHelperTest < ActionView::TestCase

  test "full title should return base title when page title is empty" do
    assert_equal full_title, "Roadev"
  end

  test "full title should return base title and appended page title when page title is not empty" do
    assert_equal full_title("Page"), "Page | Roadev"
  end
end
