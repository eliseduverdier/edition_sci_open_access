require 'test_helper'

class ReadingListFoldersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reading_list_folder = reading_list_folders(:one)
  end

  test "should get index" do
    get reading_list_folders_url
    assert_response :success
  end

  test "should get new" do
    get new_reading_list_folder_url
    assert_response :success
  end

  test "should create reading_list_folder" do
    assert_difference('ReadingListFolder.count') do
      post reading_list_folders_url, params: { reading_list_folder: { name: @reading_list_folder.name } }
    end

    assert_redirected_to reading_list_folder_url(ReadingListFolder.last)
  end

  test "should show reading_list_folder" do
    get reading_list_folder_url(@reading_list_folder)
    assert_response :success
  end

  test "should get edit" do
    get edit_reading_list_folder_url(@reading_list_folder)
    assert_response :success
  end

  test "should update reading_list_folder" do
    patch reading_list_folder_url(@reading_list_folder), params: { reading_list_folder: { name: @reading_list_folder.name } }
    assert_redirected_to reading_list_folder_url(@reading_list_folder)
  end

  test "should destroy reading_list_folder" do
    assert_difference('ReadingListFolder.count', -1) do
      delete reading_list_folder_url(@reading_list_folder)
    end

    assert_redirected_to reading_list_folders_url
  end
end
