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



  test "should get new" do
    sign_in_as(:one)
    get new_paper_url
    assert_response :success
  end

  test "should create paper" do
    sign_in_as(:one)
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
    sign_in_as(:one)
    get edit_paper_url(@paper)
    assert_response :success
  end

  test "should update paper" do
    sign_in_as(:one)
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


  test "should destroy paper" do
    sign_in_as(:one)
    assert_difference('Paper.count', -1) do
      delete paper_url(@paper)
    end

    assert_redirected_to papers_url
  end
end
