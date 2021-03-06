class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :except => [:show , :new , :create, :edit, :update, :directory]
  before_filter :logged, :except => [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if session[:user_id] != @user.id
      redirect_to error_url
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end
  
  #Passes through the @users and @staff variables to the directory view
  def directory
    @users = User.find_by_sql ["SELECT * FROM users WHERE public_profile = true AND user_type_id = 1 ORDER BY last_name, first_name"]
    @staff = User.find_by_sql ["SELECT * FROM users WHERE public_profile = true AND user_type_id = 2 ORDER BY last_name, first_name"]
  end 
  
  #TODO: remove this method (redundant)
  def newStaff
  end
  
  #TODO: remove this method (redundant)
  def createStaff
    flash[:info] = "Ok"
  end 
  
  #Passes through the variable for the staff listing page
  def staff
    @staff = User.where(user_type_id: 2)
  end 

  # POST /users
  # POST /users.json
  def create
    #Create the user from the form submission
    if admin?
      params[:user][:user_type_id] = 2;
    else
      params[:user][:user_type_id] = 1;
    end
    
    @user = User.new(id: params[:user][:id], user_type_id: params[:user][:user_type_id], first_name: params[:user][:first_name],last_name: params[:user][:last_name], 
                          email: "#{params[:user][:id]}@umail.ucc.ie", phone_num: params[:user][:phone_num], 
                          password: params[:user][:password], password_confirmation: params[:user][:password_confirmation], public_profile: params[:user][:password_confirmation])
    
    #Assign the user an email depending on whether they are student or staff
    if params[:user][:user_type_id] == 2
      @user.email = params[:user][:email]
    end
    
    #Staff will be public by default
    if params[:user][:user_type_id] == 2
      @user.public_profile = true
    end
    
    respond_to do |format|
      if check_for_existing_user(@user) 
        if @user.save
          
          if admin?
            format.html { redirect_to staff_path, notice: "Staff account for #{params[:user][:first_name]} #{params[:user][:last_name]} has been created" }
            format.json { render :show, status: :created, location: @user }
          else
            log_in(@user)
            #AppMailer.welcome_email(@user).deliver
            format.html { redirect_to dashboard_path, notice: 'Your account has been created' }
            format.json { render :show, status: :created, location: @user }
          end
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  #Make sure the new user cannot override an existing user
  def check_for_existing_user(newUser)
    if User.exists?(newUser.id)
      #Add an error to the errors arra
      @user.errors.add(:user, "already exists!")
      false
    else
      true
    end
  end 

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user #User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_type_id, :user_id, :first_name, :last_name, :email, :phone_num, :password, :password_confirmation, :public_profile)
    end
end
