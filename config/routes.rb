Rails.application.routes.draw do
  root 'welcome#index'
  
  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :dashboard, only: :index
  resources :sessions, only: [:create, :destroy]
end
