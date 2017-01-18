require 'test_helper'

class PaperTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    # editor = people(:editor)
    # researcher = people(:researcher)
    # reader = people(:reader)

    @paperOkay = Paper.new(
      title: 'Title',
      abstract: 'Abstract'
    )
  end

  test 'should create paper' do
    assert @paperOkay.valid?
  end

end
