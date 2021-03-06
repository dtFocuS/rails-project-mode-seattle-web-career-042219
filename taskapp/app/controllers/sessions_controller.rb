class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(user_name: params[:session][:user_name])
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to users_path
    else
      # Create an error message.
      @error_message = "Incorrect username and/or password"

      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end


end
