# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :flats do
    collection do
      get :find_tenant
    end
    resources :belongings, only: %i[create show edit update destroy] do
      resources :todos, only: %i[create update destroy]
      post '/add_tenant/:id', to: 'flats#add_tenant', as: :add_tenant
    end
  end

  resources :notifications, only: %i[update]

  get '/profile', to: 'pages#profile', as: :profile
end
