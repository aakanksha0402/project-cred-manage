class CredentialsController < ApplicationController
  before_action :set_project_environment, only: [:index, :create, :new]
  before_action :set_credential, only: [:show, :edit, :update, :destroy]

  # GET /credentials
  # GET /credentials.json
  def index
    @credentials = @project_environment.credentials.all
  end

  # GET /credentials/1
  # GET /credentials/1.json
  def show
  end

  # GET /credentials/new
  def new
    @credential = @project_environment.credentials.new
  end

  # GET /credentials/1/edit
  def edit
  end

  # POST /credentials
  # POST /credentials.json
  def create
    @credential = @project_environment.credentials.new(credential_params)

    respond_to do |format|
      if @credential.save
        format.html { redirect_to @credential, notice: 'Credential was successfully created.' }
        format.json { render :show, status: :created, location: @credential }
      else
        format.html { render :new }
        format.json { render json: @credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credentials/1
  # PATCH/PUT /credentials/1.json
  def update
    respond_to do |format|
      if @credential.update(credential_params)
        format.html { redirect_to @credential, notice: 'Credential was successfully updated.' }
        format.json { render :show, status: :ok, location: @credential }
      else
        format.html { render :edit }
        format.json { render json: @credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credentials/1
  # DELETE /credentials/1.json
  def destroy
    @credential.destroy
    respond_to do |format|
      format.html { redirect_to credentials_url, notice: 'Credential was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credential
      @credential = Credential.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credential_params
      params.require(:credential).permit(:name, :project_environment_id, :provider_name, :URL, :role)
    end

    def set_project_environment
      @project_environment = ProjectEnvironment.find_by(id: params[:project_environment_id])
    end
end
