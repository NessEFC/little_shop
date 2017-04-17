Rails.application.routes.draw do
  root to: 'escapes#index'

  resources :escapes, only: [:index, :show]

  resource :cart, only: [:show, :update, :create, :destroy]

  resources :users, only: [:new, :create, :edit, :update]

  resources :orders, only: [:index, :show, :create, :update]

  namespace :admin do
    get '/dashboard', to: 'users#dashboard'
    resources :users, only: [:edit, :update, :show]
  end


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#dashboard'

  get '/:category_name', to: 'categories#index'
end
