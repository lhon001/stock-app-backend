class Api::V1::UsersController < ApplicationController

  # create a user
  def create
    user = User.create(name: user_params[:name], username: user_params[:username], password: user_params[:password])
    if user.valid?
      # default_portfolio = Portfolio.create(name:'Stock Portfolio')
      render json: user, status: :created
    else
      render json: {error: "User not created"}
    end
  end

  # display a user upon login
  def show
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :username, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
