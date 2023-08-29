# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :flats, except: %i[new] do
    resources :belongings, only: %i[create]
    resources :todos, only: %i[create]
  end

  resources :belongings, only: %i[show update destroy]
  resources :todos, only: %i[show update destroy]

  resources :notifications, only: %i[show index create]

  get '/profile', to: 'pages#profile', as: :profile
end
