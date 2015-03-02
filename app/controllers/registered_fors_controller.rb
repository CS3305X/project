class RegisteredForsController < ApplicationController
  before_action :set_registered_for, only: [:show, :edit, :update, :destroy]
  before_filter :logged

  # GET /registered_fors
  # GET /registered_fors.json
  def index
      @registered_fors = RegisteredFor.where(user_id: session[:user_id])
  end

  # GET /registered_fors/new
  def new
    @registered_fors = RegisteredFor.new
    @subjects = Subject.all
  end
  
  #Check to see how many credits a user has before adding more modules (max 60)
  def checkCredits(newModule)
    newCredits = Subject.find_by(module_code: newModule)
    newCredits = newCredits.credits
    #user = User.find_by(id: session[:user_id])
    userCredits = current_user.credits
    if 60 <= userCredits || userCredits == 60
      flash[:danger] = "Can't add more than 60 credits!"
      false
    elsif userCredits + newCredits > 60
      false
    else
      current_user.credits += newCredits 
      current_user.save
      true
    end 
  end
  
  ##Check to see if the user has already registered for the module
  def validateModules(moduleCode)
    if !RegisteredFor.find_by(user_id: session[:user_id], module_code: moduleCode)
      true
    else
      flash[:danger] = "You are already registered for #{moduleCode}"
      false
    end 
  end
  
  #If a module is removed also remove the credits from the users credit column.
  def removeCredits(removedModule)
    user = User.find(session[:user_id])
    removedModule = Subject.find_by(module_code: removedModule)
    user.credits -= removedModule.credits
    user.save
  end

  # POST /registered_fors
  # POST /registered_fors.json
  def create
    @registered_for = RegisteredFor.new(user_id: session[:user_id], module_code: params[:module_code])
    respond_to do |format|
      if validateModules(@registered_for.module_code) && checkCredits(@registered_for.module_code)
        @registered_for.save if @registered_for.valid?
        flash[:success] = "Now registered for #{@registered_for.module_code} | "
        format.html { redirect_to modules_url }
        format.json { render :index, status: :created, location: @registered_for }
      else
        format.html { redirect_to modules_url}
        format.json { render json: @registered_for.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registered_fors/1
  # DELETE /registered_fors/1.json
  def destroy
    removeCredits(@registered_for.module_code)
    @registered_for.destroy
    respond_to do |format|
      flash[:success] = "Module successfully removed!"
      format.html { redirect_to modules_url}
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
