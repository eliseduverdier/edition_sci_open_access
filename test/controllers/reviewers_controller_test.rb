require 'test_helper'

class ReviewersControllerTest < ActionDispatch::IntegrationTest
    # TODO take into account namespace /papers/:paper_id/reviews
  # setup do
  #   @reviewer = reviewers(:one)
  # end
  #
  # test "should get index" do
  #   get reviewers_url
  #   assert_response :success
  # end
  #
  # test "should get new" do
  #   get new_reviewer_url
  #   assert_response :success
  # end
  #
  # test "should create reviewer" do
  #   assert_difference('Reviewer.count') do
  #     post reviewers_url, params: { reviewer: { content: @reviewer.content, paper_id: @reviewer.paper_id, person_id: @reviewer.person_id, status: @reviewer.status } }
  #   end
  #
  #   assert_redirected_to reviewer_url(Reviewer.last)
  # end
  #
  # test "should show reviewer" do
  #   get reviewer_url(@reviewer)
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get edit_reviewer_url(@reviewer)
  #   assert_response :success
  # end
  #
  # test "should update reviewer" do
  #   patch reviewer_url(@reviewer), params: { reviewer: { content: @reviewer.content, paper_id: @reviewer.paper_id, person_id: @reviewer.person_id, status: @reviewer.status } }
  #   assert_redirected_to reviewer_url(@reviewer)
  # end
  #
  # test "should destroy reviewer" do
  #   assert_difference('Reviewer.count', -1) do
  #     delete reviewer_url(@reviewer)
  #   end
  #
  #   assert_redirected_to reviewers_url
  # end
end
