class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      logger.debug("SIGN-IN SUCCESSFUL");
      session[:user_id] = @user.id;
      redirect_to root_path, notice: "Signed in Successfully!"
    else
      logger.debug("WRONG CREDENTIALS");
      flash[:alert] = "Wrong credentials"
      render :new
    end

  end
  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: "Signed out"
  end
end
