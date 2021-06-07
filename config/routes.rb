Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :dashboard, only: [:index]
  resources :users, only: [:edit, :update]
  resources :sessions, only: [:create, :destroy]

  get '/*something', to: 'application#authorized'
end
