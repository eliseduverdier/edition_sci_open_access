class ReviewersController < ApplicationController
  before_action :set_reviewer, only: [:show, :edit, :update, :destroy]

  # GET /papers/:paper_id/reviews
  # GET /papers/:paper_id/reviews.json
  def index
    @reviews = Reviewer.where(paper_id: params[:paper_id])
    @paper = Paper.find(params[:paper_id])
  end

  # GET /reviews/mine
  # GET /reviews/mine.json
  def mine
    @reviews = Reviewer.where(person_id: current_user.id).all
  end

  # GET /papers/:paper_id/reviews/1
  # GET /papers/:paper_id/reviews/1.json
  def show
  end

  # GET /papers/:paper_id/reviews/new
  def new
    @paper = Paper.find(params[:paper_id])
    @reviewer = Reviewer.new
  end

  # GET /reviewers/1/edit
  def edit
    @paper = Paper.find(params[:paper_id])
  end

  # POST /papers/:paper_id/reviews
  # POST /papers/:paper_id/reviews.json
  def create
    # @paper = Paper.find(params[:paper_id])
    # TODO get author_id from current session
    @reviewer = Reviewer.new(reviewer_params)
    @reviewer.paper_id = params[:paper_id]
    @reviewer.person_id = current_user.id

    respond_to do |format|
      if @reviewer.save
        format.html { redirect_to paper_path( :id => @reviewer.paper_id),
                    notice: 'Reviewer was successfully created.' }
        format.json { render :show, status: :created, location: @reviewer }
      else
        format.html { render :new }
        format.json { render json: @reviewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /papers/:paper_id/reviews/1
  # PATCH/PUT /papers/:paper_id/reviews/1.json
  def update
    respond_to do |format|
      if @reviewer.update(reviewer_params)
        format.html { redirect_to @reviewer, notice: 'Reviewer was successfully updated.' }
        format.json { render :show, status: :ok, location: @reviewer }
      else
        format.html { render :edit }
        format.json { render json: @reviewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/:paper_id/reviews/1
  # DELETE /papers/:paper_id/reviews/1.json
  def destroy
    @reviewer.destroy
    respond_to do |format|
      format.html { redirect_to reviewers_url, notice: 'Reviewer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reviewer
      @reviewer = Reviewer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reviewer_params
      params.require(:reviewer).permit(:person_id, :status, :content)
    end
end
