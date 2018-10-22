Rails.application.routes.draw do
<<<<<<< HEAD
  root to: "home#distance"
=======
  root to: "home#yelp"

  namespace :api do
    root to: "home#yelp"
    resources :home, only: [:yelp]
  end

>>>>>>> 2dde8d683048f52fa9058a234d2687fb8b15b760
end
