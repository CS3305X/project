class RegisteredForsController < ApplicationController
  before_action :set_registered_for, only: [:show, :edit, :update, :destroy]

  # GET /registered_fors
  # GET /registered_fors.json
  def index
    @registered_fors = RegisteredFor.where(session[:user_id])
  end

  # GET /registered_fors/1
  # GET /registered_fors/1.json
  def show
  end

  # GET /registered_fors/new
  def new
    @registered_fors = RegisteredFor.new
    @subjects = Subject.all
  end

  # GET /registered_fors/1/edit
  def edit
  end

  # POST /registered_fors
  # POST /registered_fors.json
  def create
    @registered_for = RegisteredFor.new(user_id: session[:user_id], module_code: params[:module_code])
    
    respond_to do |format|
      if @registered_for.save
        format.html { redirect_to registered_fors_url, notice: 'Registered for was successfully created.' }
        format.json { render :index, status: :created, location: @registered_for }
      else
        format.html { render :new }
        format.json { render json: @registered_for.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registered_fors/1
  # PATCH/PUT /registered_fors/1.json
  def update
    respond_to do |format|
      if @registered_for.update(registered_for_params)
        format.html { redirect_to @registered_for, notice: 'Registered for was successfully updated.' }
        format.json { render :show, status: :ok, location: @registered_for }
      else
        format.html { render :edit }
        format.json { render json: @registered_for.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registered_fors/1
  # DELETE /registered_fors/1.json
  def destroy
    @registered_for.destroy
    respond_to do |format|
      format.html { redirect_to registered_fors_url, notice: 'Registered for was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registered_for
      @registered_for = RegisteredFor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registered_for_params
      #params.require(:registered_fors)#.permit(:user_id, :module_code)
    end
end
