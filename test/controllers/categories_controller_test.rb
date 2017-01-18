require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  include SessionsHelper

  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    logged_as(people(:admin))
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    logged_as(people(:admin))
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: @category.name } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should show all papers from a category" do
    get category_url(@category)
    assert_response :success
    # assert contains papers...
  end

  test "should get edit" do
    logged_as(people(:admin))
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    logged_as(people(:admin))
    patch category_url(@category), params: { category: { name: @category.name } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    logged_as(people(:admin))
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end
