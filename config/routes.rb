Rails.application.routes.draw do
  root to: "home#yelp"

  namespace :api do
    root to: "home#yelp"
    resources :home, only: [:yelp]
  end



  post '/register' => 'users#create'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'



end
