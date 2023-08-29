Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :flats, only: [:index, :show, :create, :update, :destroy] do
    resources :belongings, only: [:index, :show, :create, :update, :destroy ]
  end
  resources :todos, only: [:show, :create, :destroy]
  resources :users, only: [:show, :edit, :update] do
    resources :notifications, only: [:show, :index, :create]
  end
end
