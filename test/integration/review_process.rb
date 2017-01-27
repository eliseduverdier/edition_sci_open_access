require 'test_helper'

class ReviewProcessTest < ActionDispatch::IntegrationTest

  def setup
  end

  test 'RESEARCHER SUBMIT PAPER' do
    logged_as(person(:one))

    # writes article
    get new_paper_path(@user)
    assert_template 'papers/new'

    #submit article
    post papers_path(), params: { paper: {
        paper_type: 'article',
        title: 'A Title',
        abstract: 'An abstract',
        html_content: '....',
        licence: '',
        category_id: 1,
        keywords: '["abc", "def", "ghi"]'
      }
    }
    assert_template 'paper/show'


    # editor send reviews

    # author review

    # all author have reviewed

    # editor validates the reviews

    # 



  end
end
