require "test_helper"

class Admin::LearningPathsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learning_path = learning_paths(:one)
    @another_learning_path = learning_paths(:three)
  end

  test "should get index" do
    get admin_learning_paths_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_learning_path_url
    assert_response :success
  end

  test "should create learning_path" do
    assert_difference("LearningPath.count") do
      learning_path = {
        title: "title",
        description: "description"
      }
      post admin_learning_paths_url, params: { learning_path: learning_path }
    end

    assert_redirected_to [:admin, LearningPath.last]
  end

  test "should show learning_path" do
    get admin_learning_path_url(@learning_path)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_learning_path_url(@learning_path)
    assert_response :success
  end

  test "should update learning_path" do
    learning_path = {
      title: "title",
      description: "description"
    }
    patch admin_learning_path_url(@learning_path), params: { learning_path: learning_path }
    assert_redirected_to [:admin, @learning_path]
  end

  test "should destroy learning_path" do
    assert_difference("LearningPath.count", -1) do
      delete admin_learning_path_url(@another_learning_path)
    end

    assert_redirected_to admin_learning_paths_url
  end
end
