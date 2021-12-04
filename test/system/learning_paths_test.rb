require "application_system_test_case"

class LearningPathsTest < ApplicationSystemTestCase
  setup do
    @learning_path = learning_paths(:one)
  end

  test "visiting the index" do
    visit learning_paths_url
    assert_selector "h1", text: "Learning Paths"
  end

  test "creating a Learning path" do
    visit learning_paths_url
    click_on "New Learning Path"

    click_on "Create Learning path"

    assert_text "Learning path was successfully created"
    click_on "Back"
  end

  test "updating a Learning path" do
    visit learning_paths_url
    click_on "Edit", match: :first

    click_on "Update Learning path"

    assert_text "Learning path was successfully updated"
    click_on "Back"
  end

  test "destroying a Learning path" do
    visit learning_paths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Learning path was successfully destroyed"
  end
end
