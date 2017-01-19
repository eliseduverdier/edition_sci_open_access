class PapersController < ApplicationController
  before_action :set_paper,        only: [:show, :edit, :update, :destroy]

  # permissions to access
  before_action :logged_in_author, only: [:edit, :update, :destroy]
  before_action :is_researcher,    only: [:new, :create]
  before_action :is_editor,        only: [:index_pending, :index_refused, :index_all]

  # GET /papers
  # GET /papers.json
  def index
    @papers = Paper.where(status: 2)
  end

  # GET /papers/pending
  # GET /papers/pending.json
  def index_pending
    @papers = Paper.where(status: [-1, 0, 1])
    render :index
  end

  # GET /papers/refused
  # GET /papers/refused.json
  def index_refused
    @papers = Paper.where(status: 3)
    render :index
  end

  # GET /papers/all
  # GET /papers/all.json
  def index_all
    @papers = Paper.all
    render :index
  end


##########################################################


  # GET /papers/1
  # GET /papers/1.json
  def show
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end


##########################################################

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

  ##########################################################

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

end