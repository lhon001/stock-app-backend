require 'bigdecimal'
require 'bigdecimal/util'
class Api::V1::SearchController < ApplicationController

  def show
    # byebug
    chart = RestClient.get("https://api.iextrading.com/1.0/stock/#{search_params}/chart")
    chart_resp = JSON.parse(chart)

    stats = RestClient.get("https://api.iextrading.com/1.0/stock/#{search_params}/stats")
    stats_resp = JSON.parse(stats)

    company = RestClient.get("https://api.iextrading.com/1.0/stock/#{search_params}/company")
    company_resp = JSON.parse(company)

    logo = RestClient.get("https://api.iextrading.com/1.0/stock/#{search_params}/logo")
    logo_resp = JSON.parse(logo)

    price = RestClient.get("https://api.iextrading.com/1.0/stock/#{search_params}/price")
    price_resp = price.to_f

    quote = RestClient.get("https://api.iextrading.com/1.0/stock/#{search_params}/quote")
    quote_resp = JSON.parse(quote)

    # byebug

    formatted_json = {
      chart: chart_resp,
      companyName: company_resp["companyName"],
      symbol: company_resp["symbol"],
      description: company_resp["description"],
      website: company_resp["website"],
      logo: logo_resp["url"],
      price: price_resp,
      marketcap: stats_resp["marketcap"],
      week52high: stats_resp["week52high"],
      week52low: stats_resp["week52low"],
      priceToBook: stats_resp["priceToBook"],
      priceToSales: stats_resp["priceToSales"],
      latestEPS: stats_resp["latestEPS"],
      beta: stats_resp["beta"],
      returnOnEquity: stats_resp["returnOnEquity"],
      peRatio: quote_resp["peRatio"],
    }

    render json: formatted_json
  end

  def index
    all_Stocks = RestClient.get("https://api.iextrading.com/1.0/ref-data/symbols")
    stock_symbols = JSON.parse(all_Stocks)

    render json: stock_symbols
  end

  def get_news
    # byebug
    news = RestClient.get("https://api.iextrading.com/1.0/stock/#{search_params}/news")

    render json: news
  end

  private

  def search_params
    params[:id]
  end

end
