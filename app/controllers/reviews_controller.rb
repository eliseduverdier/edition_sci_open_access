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
    if (review_params.reviewer_ids) # many reviewers (start)
      review_params.reviewer_ids.each do |reviewer_id|
        @review = Review.create(
            paper_id: params[:paper_id],
            reviewer_id: reviewer_id,
            editor_id: current_user.id,
            status: 'pending')
      end
    else # one reviewer (add one)
      @review = Review.new(
          paper_id: params[:paper_id],
          reviewer_id: reviewer_id,
          editor_id: current_user.id,
          status: 'pending')
    end

    if @review.save
      redirect_to paper_path( :id => @review.paper_id),
                  notice: 'Review was successfully created.'
    else
      render :new # display errors
    end
  end

  # PATCH/PUT /papers/:paper_id/reviews/1
  # update the reviews
  # Done by Reviewers
  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end




  # DELETE /papers/:paper_id/reviews/1
  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:reviewer_id, :reviewer_ids, :status, :content)
    end
end
