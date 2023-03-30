require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount Sidekiq::Web => '/sidekiq'

  namespace :v1 do
    resources :users, except: [:index]
    resources :players
    resources :teams
    resources :notifications
    resources :subscriptions
    resources :nationalities, only: [:index]

    post '/auth/signin', to: 'auth#signin'
  end

  get '/*a', to: 'application#not_found'
end
