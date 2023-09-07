# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :flats do
    collection do
      get :find_tenant
      post :add_tenant
    end
    resources :belongings, only: %i[create show edit update destroy] do
      resources :todos, only: %i[create update destroy]
    end
  end

  resources :notifications, only: %i[update]

  get '/profile', to: 'pages#profile', as: :profile
  get '/all_flats/:id&(:query)', to: 'flats#all_flats', as: :all_flats
end
