class UsertypesController < ApplicationController
  before_action :set_usertype, only: [:show, :edit, :update, :destroy]
  before_filter :authorize
  before_filter :logged

  # GET /usertypes
  # GET /usertypes.json
  def index
    @usertypes = Usertype.all
  end

  # GET /usertypes/1
  # GET /usertypes/1.json
  def show
  end

  # GET /usertypes/new
  def new
    @usertype = Usertype.new
  end

  # GET /usertypes/1/edit
  def edit
  end

  # POST /usertypes
  # POST /usertypes.json
  def create
    @usertype = Usertype.new(usertype_params)

    respond_to do |format|
      if @usertype.save
        format.html { redirect_to @usertype, notice: 'Usertype was successfully created.' }
        format.json { render :show, status: :created, location: @usertype }
      else
        format.html { render :new }
        format.json { render json: @usertype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usertypes/1
  # PATCH/PUT /usertypes/1.json
  def update
    respond_to do |format|
      if @usertype.update(usertype_params)
        format.html { redirect_to @usertype, notice: 'Usertype was successfully updated.' }
        format.json { render :show, status: :ok, location: @usertype }
      else
        format.html { render :edit }
        format.json { render json: @usertype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usertypes/1
  # DELETE /usertypes/1.json
  def destroy
    @usertype.destroy
    respond_to do |format|
      format.html { redirect_to usertypes_url, notice: 'Usertype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usertype
      @usertype = Usertype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usertype_params
      params.require(:usertype).permit(:type_id, :type_name)
    end
end
