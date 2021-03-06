class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy]
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end


  def create
   @user = User.new(user_params)
   if @user.save
     log_in @user
     flash[:info] = "Welcome to the to-do app, #{@user.name}"
     redirect_to @user
   else
     render 'new'
   end
  end

  def admin
    @users = User.paginate(page: params[:page])
  end

  def destroy
    a = User.find(params[:id]).name
    User.find(params[:id]).destroy
    flash[:success] = "#{a} has been deleted!"
    redirect_to users_url
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

 def edit
   @user = User.find(params[:id])
 end

 def update
  @user = User.find(params[:id])
  if @user.update_attributes(user_params)
    flash[:success] = "Profile for @user.name has been updated"
    redirect_to(@user)
  else
    flash[:danger] = "Update Failed."
    render 'edit'
  end
end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation, :admin)
    end
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "You are not logged in. Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      if !current_user?(@user)
        flash[:danger] = "You are not authorized to visit this page."
        redirect_to(root_url)
      end
    end
  end
