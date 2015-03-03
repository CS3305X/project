class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :except => [:show , :new , :create]
  before_filter :logged, :except => [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    #Create the user from the form submission
    @user = User.new(id: params[:user][:id], user_type_id: params[:user][:user_type_id],
                    first_name: params[:user][:first_name],last_name: params[:user][:last_name], 
                          email: "#{params[:user][:id]}@umail.ucc.ie", phone_num: params[:user][:phone_num], 
                          password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    
    #Assign the user an email depending on whether they are student or staff
    if params[:user][:user_type_id] == '2'
      @user.email = params[:user][:email]
    end
    
    respond_to do |format|
      if check_for_existing_user(@user)
        @user.save
        log_in(@user)
        format.html { redirect_to events_path, notice: 'Your account has been created' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def check_for_existing_user(newUser)
    if User.exists?(newUser.id)
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
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_type_id, :user_id, :first_name, :last_name, :email, :phone_num, :password, :password_confirmation)
    end
end
