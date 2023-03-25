Rails.application.routes.draw do
  namespace :v1 do
    resources :players
    resources :teams
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
