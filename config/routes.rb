Rails.application.routes.draw do
  root "stations#index"
  get "/stations", to: "stations#index"
end
