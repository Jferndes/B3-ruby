require "test_helper"

class StepEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get step_entries_index_url
    assert_response :success
  end

  test "should get show" do
    get step_entries_show_url
    assert_response :success
  end

  test "should get new" do
    get step_entries_new_url
    assert_response :success
  end

  test "should get create" do
    get step_entries_create_url
    assert_response :success
  end

  test "should get edit" do
    get step_entries_edit_url
    assert_response :success
  end

  test "should get update" do
    get step_entries_update_url
    assert_response :success
  end

  test "should get destroy" do
    get step_entries_destroy_url
    assert_response :success
  end
end
