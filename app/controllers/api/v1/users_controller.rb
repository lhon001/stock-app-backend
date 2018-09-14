class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show, :get_user_portfolios]
  # create a user
  def create
    user = User.new(name: user_params[:name], username: user_params[:username], password: user_params[:password])
    if user.valid?
      if !User.find_by(username: user_params[:username])
        user.save
        default_portfolio = Portfolio.create(name:'Stock Portfolio', user_id: user.id)
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
    user = User.find(params[:id])
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    render json: {status: "User Deleted"}
  end

  def login
   user = User.find_by(username: user_params[:username])
   if user && user.authenticate(user_params[:password])
     render json: user
   else
     render json: {error: "login failed"}, status: 401
   end
  end

  def get_stock
    user = User.find(params[:id])
    users_stocks = user.stocks

    render json: users_stocks
  end

  def get_user_portfolios
    user_portfolios = @user.portfolios

    render json: user_portfolios
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def find_user_portfolios
    @user_protfolios = @user.portfolios
  end

end
