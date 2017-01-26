require 'test_helper'

class PapersControllerTest < ActionDispatch::IntegrationTest

  include SessionsHelper

  setup do
    @paper = papers(:one)
  end

  test "should get list of papers" do
    get papers_url
    assert_response :success
  end


  test "should show paper" do
    get paper_url(@paper)
    assert_response :success
  end


 # SIMULATE WRITE, EDIT, AND DELETE PAPER
  test "should get new" do
    log_in_as(people(:one))
    get new_paper_url
    assert_response :success
  end

  test "should create paper" do
    log_in_as(people(:one))

    assert_difference('Paper.count') do
      post papers_url, params: { paper: {
        title: @paper.title,
        abstract: @paper.abstract,
        category_id: @paper.category_id,
        html_content: @paper.html_content,
        pdf_url: @paper.pdf_url,
        status: @paper.status,
        tex_content: @paper.tex_content,
        paper_type: @paper.paper_type
      } }
    end

    assert_redirected_to paper_url(Paper.last)
  end

  test "should get edit" do
    log_in_as(people(:one))
    get edit_paper_url(@paper)
    assert_response :success
  end

  test "should update paper" do
    log_in_as(people(:one))
    patch paper_url(@paper), params: { paper: {
      title: @paper.title,
      abstract: @paper.abstract,
      category_id: @paper.category_id,
      html_content: @paper.html_content,
      pdf_url: @paper.pdf_url,
      status: @paper.status,
      tex_content: @paper.tex_content,
      paper_type: @paper.paper_type
    } }
    assert_redirected_to paper_url(@paper)
  end

  test "should delete paper" do
    log_in_as(people(:one))

    assert_difference('Paper.count', -1) do
      delete paper_url(@paper)
    end

    assert_redirected_to papers_url
  end

  # EDITOR: SIMULATE ASK FOR REVIEWS
  test "should send review invitation" do
    log_in_as(people(:editor))
    # review#new
  end

  test "should ask the revision of a paper to its author" do
    log_in_as(people(:editor))
    post ask_paper_revision_path(paper(:one))
  end

  test "should accept a paper" do
    log_in_as(people(:editor))
    post accept_paper_path(paper(:one))
  end

  test "should refuse a paper" do
    log_in_as(people(:editor))
    post refuse_paper_path(paper(:one))
  end

end
