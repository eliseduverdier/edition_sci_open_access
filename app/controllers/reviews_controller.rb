class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /papers/:paper_id/reviews
  # GET /papers/:paper_id/reviews.json
  def index
    @reviews = Review.where(paper_id: params[:paper_id])
    @paper = Paper.find(params[:paper_id])
  end

  # GET /reviews/mine
  # GET /reviews/mine.json
  def mine
    @reviews = Review.where(reviewer_id: current_user.id).all
  end

  # GET /papers/:paper_id/reviews/1
  def show
  end


  # GET /papers/:paper_id/reviews/new
  # not used: only from paper/:id/show
  def new
    @paper = Paper.find(params[:paper_id])
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    @paper = Paper.find(params[:paper_id])
  end

  # POST /papers/:paper_id/reviews
  # creates the reviews with a "pending" status
  # Done by EDITOR
  def create
    p params[:review]
    if (params[:review][:reviewers]) # many reviewers (start)
      params[:review][:reviewers].each do |reviewer_id|
        @review = Review.new(review_params)
          @review.paper_id = params[:paper_id]
          @review.reviewer_id = reviewer_id
          @review.editor_id = current_user.id
          @review.status = 'pending'
          @review.save
      end # end loop
    # else # one reviewer (when editor adds one, for example)
    #   @review = Review.new(
    #       paper_id: params[:paper_id],
    #       reviewer_id: review_params[:reviewer],
    #       editor_id: current_user.id,
    #       status: 'pending')
    end

    redirect_to paper_path( :id => params[:paper_id]), notice: 'Review was successfully created.'
  end

  # PATCH/PUT /papers/:paper_id/reviews/1
  # update the reviews
  # Done by REVIEWER
  def update
    if @review.update(review_edit_params)
      redirect_to @review, notice: 'The review was successfully updated.'
    else
      render :edit
    end
  end


  # DELETE /papers/:paper_id/reviews/1
  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'The review was successfully deleted.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # For creation
    def review_params
      params.require(:review).permit(:reviewer, :reviewers, :status, :editor_remarks)
    end

    # For edition
    def review_edit_params
      params.require(:review).permit(:reviewer_id, :reviewer_ids, :status, :status, :content, :progression)
    end
end
