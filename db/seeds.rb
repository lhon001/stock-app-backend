# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

stock_1 = Stock.create(companyName:"Apple Inc.",
                        symbol:"AAPL",
                        description:"Apple Inc is an American multinational technology company. It designs, manufactures, and markets mobile communication and media devices, personal computers, and portable digital music players.",
                        website:"http://www.apple.com",
                        logo:"https://storage.googleapis.com/iex/api/logos/AAPL.png",
                        price: 143.28,
                        marketcap: 760334287200,
                        week52high: 156.65,
                        week52low: 93.63,
                        priceToBook: 6.19,
                        priceToSales: 7.45,
                        latestEPS: 8.29,
                        beta: 8,
                        returnOnEquity: 8.09,
                        peRatio: 4.76)
