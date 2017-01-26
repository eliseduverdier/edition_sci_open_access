class ReviewsController < ApplicationController
  before_action :set_paper, except: [:index, :mine, :create, :new]
  before_action :set_review , only: [:show, :edit, :update, :destroy]
  before_action :is_editor, only: [:validate_opinion]

  # GET /papers/:paper_id/reviews
  # GET /papers/:paper_id/reviews.json
  def index
    @reviews = Review.where(paper_id: @paper.id)
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
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  ###############################################################

  # POST /papers/:paper_id/reviews
  # creates the reviews with a "pending" status
  # Done by EDITOR
  def create
    if (params[:review][:reviewers])
      params[:review][:reviewers].each do |reviewer_id|
        unless reviewer_id.blank?
          @review = Review.create(
            status:         params[:status],
            editor_remarks: params[:editor_remarks],
            paper_id:       params[:paper_id],
            reviewer_id:    reviewer_id,
            editor_id:      current_user.id,
            progression:    'pending'
          )
        end
      end # end loop
    end

    redirect_to paper_path( :id => params[:paper_id]), notice: 'Review was successfully created.'
  end


  def validate_opinion
    status = params[:review][:status]
    @review = new_opinion(status)
    if @review.save
      redirect_to paper_path(
        :id => params[:paper_id]),
        notice: status == 3 ? 'The paper was successfully published.' : 'The paper was refused.'
    end
  end

  # PATCH/PUT /papers/:paper_id/reviews/1
  # update the review
  # Done by REVIEWER
  def update
    # if the review is marked as done
    if @review.update(review_edit_params)
      @review.update(progression: params[:review][:progression] == 'done' ? 'done' : 'ongoing')
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

  ####################################################
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end
  def set_paper
    @paper  = Paper.find(params[:paper_id])
  end

  # PARAMS # Never trust parameters from the scary internet, only allow the white list through.

  # For creation
  def review_params
    params.require(:review).permit(:reviewers, :status, :editor_remarks)
  end

  # For edition
  def review_edit_params
    params.require(:review).permit(:reviewer, :status, :content, :progression)
  end

  def review_opinion_params
    params.require(:review).permit(:status, :editor_remarks)
  end

  ####################

  # Create a new review for an opinion
  # +Params+
  # +Status+  2 for accepted, 3 for refused
  def new_opinion(status)
    review = Review.create(
      status:         params[:status],
      editor_remarks: params[:editor_remarks],
      paper_id:       params[:paper_id],
      reviewer_id:    current_user.id,
      editor_id:      current_user.id,
      progression:    'done'
    )
    if (review.is_accepted) # review -> accepted
      @paper.publish # published accepted
    elsif (review.is_refused) # review -> refused
      @paper.refuse # refused
    end
    return review
  end


end
