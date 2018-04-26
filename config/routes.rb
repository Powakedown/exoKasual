Rails.application.routes.draw do
  root to: 'pages#home'

  get "/bars-map", to: "pages#bars_map"
  get "/bars-list", to: "pages#bars_list"
  get "/bar-details", to: "pages#update_details"
end
