class Api::V1::StocksController < ApplicationController

  def create
    stock = Stock.new(companyName: stock_params[:companyName], symbol: stock_params[:symbol])
    if stock.valid?
      stock.save
      render json: stock, status: :created
    else
      render json: {error: "Stock could not be created"}
    end
  end

  private

  def stock_params
    params.require(:stock).permit(:companyName, :symbol)
  end

end
