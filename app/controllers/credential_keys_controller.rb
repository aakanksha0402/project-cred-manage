class CredentialKeysController < ApplicationController
  before_action :set_credential, only: [:index, :create, :new]
  before_action :set_credential_key, only: [:show, :edit, :update, :destroy]

  # GET /credential_keys
  # GET /credential_keys.json
  def index
    @credential_keys = CredentialKey.all
  end

  # GET /credential_keys/1
  # GET /credential_keys/1.json
  def show
  end

  # GET /credential_keys/new
  def new
    @credential_key = CredentialKey.new
  end

  # GET /credential_keys/1/edit
  def edit
  end

  # POST /credential_keys
  # POST /credential_keys.json
  def create
    @credential_key = CredentialKey.new(credential_key_params)

    respond_to do |format|
      if @credential_key.save
        format.html { redirect_to @credential_key, notice: 'Credential key was successfully created.' }
        format.json { render :show, status: :created, location: @credential_key }
      else
        format.html { render :new }
        format.json { render json: @credential_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credential_keys/1
  # PATCH/PUT /credential_keys/1.json
  def update
    respond_to do |format|
      if @credential_key.update(credential_key_params)
        format.html { redirect_to @credential_key, notice: 'Credential key was successfully updated.' }
        format.json { render :show, status: :ok, location: @credential_key }
      else
        format.html { render :edit }
        format.json { render json: @credential_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credential_keys/1
  # DELETE /credential_keys/1.json
  def destroy
    @credential_key.destroy
    respond_to do |format|
      format.html { redirect_to credential_keys_url, notice: 'Credential key was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credential_key
      @credential_key = CredentialKey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credential_key_params
      params.require(:credential_key).permit(:credential_id, :key, :value)
    end

    def set_credential
      @project_environment = Credential.find_by(id: params[:credential_id])
    end
end
