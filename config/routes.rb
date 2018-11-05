Rails.application.routes.draw do
  resources :users

  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :password_resets,     only: [:new, :create, :edit, :update]

  root 'welcome#index'
end
