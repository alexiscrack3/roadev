require "test_helper"

class LearningPathsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learning_path = learning_paths(:one)
  end

  test "should show learning_path" do
    get learning_path_url(@learning_path)
    assert_response :success
  end
end
