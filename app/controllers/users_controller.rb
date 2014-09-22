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
      redirect_to users_path, notice: "Thanks for signing up!"
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.valid?
      flash[:notice] = "#{@user.user_name} has been updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "#{@user.user_name} has been deleted"
    redirect_to login_path
  end

private
  def user_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
  end
end
