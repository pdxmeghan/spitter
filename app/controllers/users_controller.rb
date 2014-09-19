class UsersController < ApplicationController
  def index
    @user = current_user
    @spits_collection = @user.following_spits.order(created_at: :desc)
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
    @verify = Follow.find_by(:user_id => @user.id, :follower_id => current_user.id)
    @spits = @user.spits.order(:created_at => :desc)
    @follow = Follow.new
  end

private
  def user_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
  end
end
