class Api::V1::StockPortfoliosController < ApplicationController

  def create
    # byebug
    portfolio_stock = PortfolioStock.new(portfolio_id: portfolio_stock_params[:portfolio_id], stock_id: portfolio_stock_params[:stock_id])
    if portfolio_stock.valid?
      portfolio_stock.save
      render json: portfolio_stock, status: :created
    else
      render json: {error: "portfolio_stock not created"}
    end
  end

  private

  def portfolio_stock_params
    params.permit(:portfolio_id, :stock_id)
  end

end
