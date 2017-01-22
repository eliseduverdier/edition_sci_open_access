require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
    # TODO take into account namespace /papers/:paper_id/reviews

  setup do
    @review = reviews(:one)
  end

end
