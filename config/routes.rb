Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :dashboard, only: [:index]
  resources :users, only: %i[edit update]
  resources :sessions, only: %i[create destroy]
  resources :trips, only: %i[index show new create destroy]
  resources :beers, only: %i[index show]
  get '/*something' => 'application#not_found'
end
