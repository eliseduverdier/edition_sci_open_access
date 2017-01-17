class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_author, only: [:edit, :update, :destroy]

  # GET /papers
  # GET /papers.json
  def index
    @papers = Paper.all
  end

  # GET /papers/pending
  # GET /papers/pending.json
  def index_pending
    @papers = Paper.where(status: 'pending')
  end


  # GET /papers/1
  # GET /papers/1.json
  def show
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
  end

  # POST /papers
  # POST /papers.json
  def create
    @paper = Paper.new(paper_params)
    @paper.status = 0 # pending

    respond_to do |format|
      if @paper.save

        # save author
        @author = Author.new(paper_id: @paper.id, person_id: current_user.id)
        @author.save

        format.html { redirect_to @paper, notice: 'Paper was successfully created.' }
        format.json { render :show, status: :created, location: @paper }
      else
        format.html { render :new }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /papers/1
  # PATCH/PUT /papers/1.json
  def update
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to @paper, notice: 'Paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to papers_url, notice: 'Paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_params
      params.require(:paper).permit(:paper_type, :title, :abstract, :tex_content, :html_content, :category_id)
    end

    def author_params
      params.require(:paper_id, :person_id)
    end

    # Confirms the author of the paper is logged-in user.
    def logged_in_author
      if !logged_in?
        store_location
        redirect_to login_url, :flash => { :error => "Please log in to access to this page!" }
      elsif @person != current_user
        redirect_to @paper, :flash => { :error => "You don’t have access to this page!" }
      end
    end
end
