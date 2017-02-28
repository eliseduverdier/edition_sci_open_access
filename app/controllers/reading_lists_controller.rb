class ReadingListsController < ApplicationController

  before_action :set_reading_list, only: [:show, :edit, :update, :destroy]
  before_action :is_logged_in, except: [:show]
  before_action :is_public, only: [:show]

  # GET /reading_lists
  def index
    @reading_lists = ReadingList.where(person: current_user)
  end

  # GET /reading_lists/public
  def index_public
    @reading_lists = ReadingList.where(visibility: 1)
  end

  # GET /reading_lists/1
  def show
    @papers = ReadingListSave.where(reading_list_id: @reading_list.id)
  end

  # GET /reading_lists/new
  def new
    @reading_list = ReadingList.new
  end

  # GET /reading_lists/1/edit
  def edit
  end

  # POST /reading_lists
  def create
    @reading_list = ReadingList.new(reading_list_params)
    @reading_list.person_id = current_user.id

    if @reading_list.save
      redirect_to @reading_list, notice: t('reading_list.create.success')
    else
      render :new
    end
  end

  # PATCH/PUT /reading_lists/1
  def update
    if @reading_list.update(reading_list_params)
      redirect_to @reading_list, notice: t('reading_list.update.success')
    else
      render :edit
    end
  end

  # DELETE /reading_lists/1
  def destroy
    @reading_list.destroy
   redirect_to reading_lists_url, notice: t('reading_list.destroy.success')
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_reading_list
      @reading_list = ReadingList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reading_list_params
      params.require(:reading_list).permit(:name, :visibility)
    end

    def is_public
      redirect_to reading_lists_path unless @reading_list.is_public? || @reading_list.person_id == current_user.id
    end

end
