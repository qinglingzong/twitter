Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "index#index"
  post "/save", to: "index#save"
  get  "/retweet", to: "index#retweet"
  get  "/authenticate", to: "index#authenticate"
  get  "/auth/twitter", to: "index#do_authenticate"
  get '/logout', to: 'index#logout'
end
