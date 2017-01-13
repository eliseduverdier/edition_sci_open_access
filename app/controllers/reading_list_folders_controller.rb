class ReadingListFoldersController < ApplicationController
  before_action :set_reading_list_folder, only: [:show, :edit, :update, :destroy]

  # GET /reading_list_folders
  # GET /reading_list_folders.json
  def index
    @reading_list_folders = ReadingListFolder.all
  end

  # GET /reading_list_folders/1
  # GET /reading_list_folders/1.json
  def show
  end

  # GET /reading_list_folders/new
  def new
    @reading_list_folder = ReadingListFolder.new
  end

  # GET /reading_list_folders/1/edit
  def edit
  end

  # POST /reading_list_folders
  # POST /reading_list_folders.json
  def create
    @reading_list_folder = ReadingListFolder.new(reading_list_folder_params)

    respond_to do |format|
      if @reading_list_folder.save
        format.html { redirect_to @reading_list_folder, notice: 'Reading list folder was successfully created.' }
        format.json { render :show, status: :created, location: @reading_list_folder }
      else
        format.html { render :new }
        format.json { render json: @reading_list_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reading_list_folders/1
  # PATCH/PUT /reading_list_folders/1.json
  def update
    respond_to do |format|
      if @reading_list_folder.update(reading_list_folder_params)
        format.html { redirect_to @reading_list_folder, notice: 'Reading list folder was successfully updated.' }
        format.json { render :show, status: :ok, location: @reading_list_folder }
      else
        format.html { render :edit }
        format.json { render json: @reading_list_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reading_list_folders/1
  # DELETE /reading_list_folders/1.json
  def destroy
    @reading_list_folder.destroy
    respond_to do |format|
      format.html { redirect_to reading_list_folders_url, notice: 'Reading list folder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading_list_folder
      @reading_list_folder = ReadingListFolder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reading_list_folder_params
      params.require(:reading_list_folder).permit(:name)
    end
end
