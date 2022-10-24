Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "calendars/holidays" => "calendars#holidays"

  get "exchange-rates/symbols" => "exchange_rates#symbols"
  get "exchange-rates/latest" => "exchange_rates#latest"
  get "exchange-rates/convert" => "exchange_rates#convert"

end
