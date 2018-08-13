class Api::V1::UsersController < ApplicationController

  # create a user
  def create
    user = User.new(name: user_params[:name], username: user_params[:username], password: user_params[:password])
    if user.valid?
      # default_portfolio = Portfolio.create(name:'Stock Portfolio')
      if !User.find_by(username: user_params[:username])
        user.save
        render json: user, status: :created
      else
        render json: {error: "Username already taken"}
      end
    else
      render json: {error: "User not created"}
    end
  end

  # display a user upon login
  def show
    # byebug
    user = User.find(params[:id])
    render json: user
  end

  # def login
  #   user = User.find_by(username: user_params[:username])
  #   if user && user.authenticate(password: user_params[:password])
  #     render json: user
  #   else
  #     render json: {error: "Could not login"}
  #   end
  # end

  def login
  # byebug
   user = User.find_by(username: user_params[:username])
   if user && user.authenticate(user_params[:password])
     render json: user
   else
     render json: {error: "login failed"}, status: 401
   end
 end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

  def find_user
    # byebug
    @user = User.find(params[:id])
  end

end
