class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  before_action :is_admin, only: [:add, :create, :destroy]

  include CategoriesHelper

  # GET /categories
  def index
    @categories = Category.all
  end

  # GET /categories/1
  def show
    parents = get_parents(@category)
    puts parents
    @papers = Paper.where(
        status: 2,
        category_id: parents
    )
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
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
    # if @category.save
      redirect_to categories_url, notice: 'Category was successfully created.'
    # else
    #   render :new, notice: 'Error while creating category, please retry.'
    # end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
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
