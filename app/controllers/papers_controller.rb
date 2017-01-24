class PapersController < ApplicationController
  before_action :set_paper,        only: [:show, :edit, :update, :destroy]

  # permissions to access
  before_action :logged_in_author, only: [:edit, :update, :destroy]
  before_action :is_researcher,    only: [:new, :create]
  before_action :is_editor,        only: [:index_pending, :index_refused, :index_all]

  # GET /papers
  def index
    @title = "Published papers"
    @papers = Paper.where(status: 2)
  end

  # GET /papers/pending
  def index_pending
    @title = "Pending papers"
    @papers = Paper.where(status: [-1, 0, 1])
    render :index
  end

  # GET /papers/refused
  def index_refused
    @title = "Refused papers"
    @papers = Paper.where(status: 3)
    render :index
  end

  # GET /papers/all
  def index_all
    @title = "All papers"
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
    @paper.status = -1 # pending, not reviewed

    if @paper.save
      # save author
      @author = Author.new(paper_id: @paper.id, person_id: current_user.id)
      @author.save

      redirect_to @paper, notice: 'Paper was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /papers/1
  # PATCH/PUT /papers/1.json
  def update
    if @paper.update(paper_params)
      redirect_to @paper, notice: 'Paper was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    @paper.destroy
    redirect_to papers_url, notice: 'Paper was successfully destroyed.'
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

    def logged_in_author
      if !logged_in?
        store_location
        redirect_to login_url, :flash => { :error => t('people.unauthorized') }
      elsif !@paper.get_authors.include? current_user
        redirect_to @paper, :flash => { :error => t('paper.edit.forbidden') }
      end
    end

end
