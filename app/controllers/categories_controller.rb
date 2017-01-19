class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  before_action :is_admin, only: [:add, :create, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @papers = Paper.where(status: 2, category_id: params[:id])
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    names = JSON.parse params[:category][:names]
    parent = JSON.parse params[:category][:parent_category]
    names.each do |key|
      unless key.blank?
        if parent
          @category = Category.create(name: key['tag'], parent_category_id: parent)
        else
          @category = Category.create(name: key['tag'])
        end
      end
    end
# computational linguistics     quantum mechanics
    respond_to do |format|
      # if @category.save
        format.html { redirect_to categories_url, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      # else
      #   format.html { render :new }
      #   format.json { render json: @category.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :names, :parent_category)
    end

    def is_admin
      unless logged_in? && current_user.status == 'editor'
        redirect_to root_path, :flash => { :error => "You don’t have access to this page!" }
      end
    end
end
