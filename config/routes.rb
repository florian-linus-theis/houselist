# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :flats, only: [:index, :show, :create, :update, :destroy] do
    resources :belongings, only: [:show, :create, :update, :destroy ]
    resources :todos, only: [:show, :create, :destroy]
  end

  resources :notifications, only: [:show, :index, :create]

  get '/profile', to: 'pages#profile', as: :profile
end
