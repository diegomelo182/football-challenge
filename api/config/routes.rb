Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :v1 do
    resources :users, except: [:index]
    resources :players
    resources :teams
    resources :notifications

    post '/auth/signin', to: 'auth#signin'
  end

  get '/*a', to: 'application#not_found'
end
