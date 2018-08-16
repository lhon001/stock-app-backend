Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, :portfolios, :stocks, :search, :stock_portfolios
      post '/login', to: 'users#login'
      get '/user_portfolio/:id', to: 'users#get_user_portfolios'
      get '/get_stock/:id', to: 'users#get_stock'
    end
  end
end
