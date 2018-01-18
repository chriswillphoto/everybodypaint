class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :username => params[:username]
    if user.present? && user.authenticate(params[:password])
      # If a user record with the entered in the form is present AND the user is authenticated (using bcrypt's authenticate method and the password entered in the form), store their id in the session hash and redirect them to the root path.
      session[:user_id] = user.id
      flash[:notice] = "User created!"
      redirect_to root_path
    else
      # If the user cannot be authenticated, redirect them to the login_path.
      flash[:error] = "User could not be created!"
      redirect_to login_path
    end
  end

  def destroy
  end
end
