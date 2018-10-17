Rails.application.routes.draw do
  get 'home/test'

  root to: "home#test"
end
