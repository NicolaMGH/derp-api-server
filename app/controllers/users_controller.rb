class UsersController < ApplicationController

  def create
    @user = User.new(name: params[:name], email: params[:email],
      password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
    else

    end
  end


  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
