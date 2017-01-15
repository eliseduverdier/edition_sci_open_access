class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # GET /people/1/edit_password
  def edit_password
      @person = current_user
  end

  # PATCH/PUT /people/1/edit_password
  def update_password
    respond_to do |format|
      if @person.update(person_params_edit_password)
        format.html { redirect_to @person, notice: 'Your profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit_password }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        log_in @person
        format.html { redirect_to @person, notice: 'Thanks for joining us!' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:email, :password, :firstname, :lastname, :status, :bio, :level, :country, :academia_url, :research_gate_url)
    end

    # for editing one's profile
    def person_params_edit
      params.require(:person).permit(:firstname, :lastname, :status, :bio, :level, :country, :academia_url, :research_gate_url)
    end

    # for modifying password
    def person_params_edit_password
        params.require(:person).permit(:password)
    end
end
