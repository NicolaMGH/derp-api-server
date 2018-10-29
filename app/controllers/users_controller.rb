class UsersController < ApplicationController

  def create
    @user = User.new(name: params[:name], email: params[:email],
      password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
    else

    end
  end

  def name
    @user = User.find_by(id: session[:user_id])
    if @user != nil
      render json: { name: @user.name, login: true }
    else
      render json: { login: false }
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
