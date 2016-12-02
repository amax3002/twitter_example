class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by email: params[:email]

    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to tweets_path, notice: "Successful logged in!"
    else
      redirect_to new_session_path, alert: "Email and Password combination do not match."
    end
  end
end
