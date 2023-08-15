class CrmsController < ApplicationController
  before_action :set_crm, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :correct_user, only: [:edit,:update,:destroy]
  # GET /crms or /crms.json
  def index
    @crms = Crm.all
  end

  # GET /crms/1 or /crms/1.json
  def show
  end

  # GET /crms/new
  def new
    # @crm = Crm.new
    @crm =current_user.crms.build
  end

  # GET /crms/1/edit
  def edit
  end

  # POST /crms or /crms.json
  def create
    # @crm = Crm.new(crm_params)
    @crm  = current_user.crms.build(crm_params)

    respond_to do |format|
      if @crm.save
        format.html { redirect_to crm_url(@crm), notice: "Crm was successfully created." }
        format.json { render :show, status: :created, location: @crm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crms/1 or /crms/1.json
  def update
    respond_to do |format|
      if @crm.update(crm_params)
        format.html { redirect_to crm_url(@crm), notice: "Crm was successfully updated." }
        format.json { render :show, status: :ok, location: @crm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crms/1 or /crms/1.json
  def destroy
    @crm.destroy
    respond_to do |format|
      format.html { redirect_to crms_url, notice: "Crm was successfully destroyed." }
      format.json { head :no_content }
    end
  end
def correct_user
  @crm = current_user.crms.find_by(id: params[:id])
  redirect_to crm_path, notice:"Not Authorized" if @crm.nil?
end 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crm
      @crm = Crm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crm_params
      params.require(:crm).permit(:app_name, :app_phone, :app_email,:user_id)
    end
end
