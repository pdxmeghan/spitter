class UsersController < ApplicationController
  def index
    @user = current_user
    @spits_new = @user.following_spits.first
    @spit = Spit.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Thanks for signing up!"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @spits = @user.spits
  end

private
  def user_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
  end
end
