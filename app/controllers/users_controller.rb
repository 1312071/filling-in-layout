class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user, only: [:edit, :update]
  before_action :is_admin, only: :destroy
  before_action :load_user, except: [:index, :new, :create]

  def index
    @users = User.select(:id, :name, :email).where(activated: true).order(name: :asc)
      .paginate page: params[:page], per_page: Settings.per_page
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t ".check_your_email"
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".update_success"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".delete_user"
    else
      flash[:success] = t ".delete_failed"
    end
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t ".log_in"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]
    unless current_user? @user
      flash[:danger] = t ".uncorrect_user"
      redirect_to root_url
    end
  end

  def is_admin
    unless current_user.admin?
      flash[:danger] = t ".admin_required"
      redirect_to root_url
    end
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t ".user_invalid"
      redirect_to users_url
    end
  end
end
