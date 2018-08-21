class Api::V1::PortfoliosController < ApplicationController
  def show
    portfolio = Portfolio.find(params[:id])
    stocks = portfolio.stocks
    render json: stocks
  end

  def create
    portfolio = Portfolio.new(name: portfolio_params[:name], user_id: portfolio_params[:user_id])
    if portfolio.valid?
      if !Portfolio.find_by(name: portfolio_params[:name])
        portfolio.save
        render json: portfolio, status: :created
      else
        render json: {error: "Portfolios cannot have the same name"}
      end
    else
      render json: {error: "Could not create portfolio"}
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name, :user_id)
  end

end
