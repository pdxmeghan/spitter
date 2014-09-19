class FollowsController < ApplicationController
  def new
    @follow = Follow.new
  end

  def create
    @user = User.find(params[:user_id])
    @follow = Follow.create(follow_params)
    if @follow.valid?
      flash[:notice] = "You are now following #{@user.user_name}"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Sorry! That didn't work. Try again."
      redirect_to user_path(@user)
    end
  end

  def show
    @follow = Follow.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @verify = Follow.find(params[:id])
    @verify.destroy
    flash[:notice] = "You have unfollowed #{@user.user_name}."
    redirect_to user_path(@user)
  end

private
  def follow_params
    params.require(:follow).permit(:user_id, :follower_id)
  end
end
