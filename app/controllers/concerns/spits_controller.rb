class SpitsController < ApplicationController
  def new
    @spit = Spit.new
    respond_to do |format|
      format.html { redirect_to users_path }
      format.js
    end
  end

  def create
    @spit = Spit.create(spit_params)
    @user = @spit.user
    if @spit.valid?
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
    else
      flash[:notice] = "Sorry! Your spit wasn't saved. Spit again!"
      redirect_to user_path(@user)
    end
  end

private
  def spit_params
    params.require(:spit).permit(:text, :user_id)
  end
end
