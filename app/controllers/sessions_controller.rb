class SessionsController < ApplicationController


  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_back_or user_path(user)
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end