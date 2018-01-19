class UsersController < ApplicationController

  def create
    @user = User.new :username => params[:user][:username], :password => params[:user][:password]
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

end
