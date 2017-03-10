class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # permissions to access
  before_action :logged_in_as_correct_user, only: [:edit, :edit_password, :update, :destroy]
  before_action :is_logged_in, only: [:index]
  before_action :already_logged_in, only: [:new, :create]
  before_action :is_admin, only: [:activate]


  # GET /people
  def index
    if current_user.is_admin?
      @people = Person.all
    elsif current_user.is_editor?
      @people = Person.where.not(status: 'reader').where.not(activated: nil)
    else # is_researcher or reader
      @people = Person.where(status: ['researcher', 'editor']).where.not(activated: nil)
    end
  end

  # GET /people/:id/papers
  def papers
    person = Person.find(params[:id])
    @papers = person.get_papers
    @title = "Papers from #{person.full_name}"
    render :template => 'papers/index'
  end

  # GET /people/1
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
    if @person.update(person_params_edit_password)
      redirect_to @person, notice: 'Your profile was successfully updated.'
    else
      render :edit_password
    end
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      @person.send_activation_email
      flash[:info] = t('people.create.need_activation')
      # flash[:info] += "Activation token: /#{@person.activation_token}/#{CGI.@person.email}"

      # creates a default reading list for the user
      ReadingList.creates(person_id: @person.id, name: 'Your reading List')

      redirect_to root_url # TODO thanks for joining page

      # log_in @person
      # redirect_to @person, notice: 'Thanks for joining us!'
    else
      flash[:error] = t('people.create.error')
      render :new
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params_edit)
      redirect_to @person, notice: t('people.update.success')
    else
      render :edit
    end
  end

  #  ??? PATCH/PUT /people/1
  def update_password
    if @person.update(person_params_edit)
      redirect_to @person, notice: t('people.update.password.success')
    else
      render :edit
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
    redirect_to root_path, notice: t('people.delete.success')
  end

  ####################################
  #     ajax
  ####################################

  # GET /people/1/activates
  # called by ajax, return json
  def activate
    @person = Person.find(params[:id])
    if @person.nil?
      redirect_to people_path, notice: t('people.profile.not_found')
    else
      @person.activate
      redirect_to @person, notice: t('people.update.success')
    end
  end


  ####################################
  #     PRIVATE
  ####################################

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
