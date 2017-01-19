class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]


  # permissions to access
  before_action :logged_in_as_correct_user, only: [:edit, :edit_password, :update, :destroy]
  # before_action :is_logged_in, only: [:index]
  before_action :already_logged_in, only: [:new, :create]


  # GET /people
  # GET /people.json
  def index
    if current_user.is_admin?
      @people = Person.all
    elsif current_user.is_editor?
      @people = Person.where.not(status: ['admin']).where.not(activated: nil)
    elsif current_user.is_researcher?
      @people = Person.where(status: ['researcher', 'editor']).where.not(activated: nil)
    else # reader
      @people = Person.where(status: 'researcher').where.not(activated: nil)
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

    if @person.save
      @person.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      # flash[:info] += "Activation token: /#{@person.activation_token}/#{CGI.@person.email}"
      redirect_to root_url

      # log_in @person
      # format.html { redirect_to @person, notice: 'Thanks for joining us!' }
      # format.json { render :show, status: :created, location: @person }
    else
      flash[:error] = "There was a problem during registration."
      render :new
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

    ### Access rights

    # Confirms a logged-in user.
    def already_logged_in
      if logged_in?
        redirect_to root_path, :flash => { :error => "You are already logged in! Please log out first." }
      end
    end


end
