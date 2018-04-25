Rails.application.routes.draw do
  root to: 'pages#home'

  get "/bars", to: "pages#bars"
end
