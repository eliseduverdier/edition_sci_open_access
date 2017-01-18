class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # permissions to access
  before_action :is_logged_in_user, only: [:edit, :edit_password, :update, :destroy]

  before_action :is_logged_in, only: [:index]


  # GET /people
  # GET /people.json
  def index
    if current_user.is_admin?
      @people = Person.all
    elsif current_user.is_editor?
      @people = Person.where.not(status: ['admin'])
    elsif current_user.is_researcher?
      @people = Person.where(status: ['researcher', 'editor'])
    else # reader
      @people = Person.where(status: 'researcher')
    end
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
      if @person.update(person_params_edit)
        format.html { redirect_to @person, notice: 'Your profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  #  ??? PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update_password
    respond_to do |format|
      if @person.update(person_params_edit)
        format.html { redirect_to @person, notice: 'Your profile was successfully updated.' }
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
      format.html { redirect_to root_path, notice: 'Your profile was successfully deleted.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # sign up / log in
    def person_params
      params.require(:person).permit(:email, :password, :firstname, :lastname, :status)
    end

    # for editing one’s profile
    def person_params_edit
      params.require(:person).permit(:firstname, :lastname, :status, :bio, :level, :country, :academia_url, :research_gate_url)
    end

    # for modifying password
    def person_params_edit_password
        params.require(:person).permit(:password)
    end

end
