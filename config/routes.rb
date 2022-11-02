Rails.application.routes.draw do
  root "stations#index"
  get "/stations", to: "stations#index"

  resources :stations do
    get :country_aqi, on: :member
  end
end
