require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_path
    assert_response :success
  end

  test "learning path should be displayed" do
    get dashboard_path
    learning_paths = assigns(:learning_paths)
    assert learning_paths.length == 3
  end
end
