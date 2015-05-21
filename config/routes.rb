Rails.application.routes.draw do
  root "home#index"
  # get 'home/index'

  namespace :api do
    resources :ideas, defaults: { format: "json" }
  end
end
