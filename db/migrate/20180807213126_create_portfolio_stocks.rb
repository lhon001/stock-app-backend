class CreatePortfolioStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolio_stocks do |t|
      t.integer :portfolio_id
      t.integer :stock_id

      t.timestamps
    end
  end
end
