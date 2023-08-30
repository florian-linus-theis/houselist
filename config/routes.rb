# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :flats do
    resources :belongings, only: %i[create show]
    resources :todos, only: %i[create]
  end

  resources :belongings, only: %i[edit update destroy]
  resources :todos, only: %i[show update destroy]

  resources :notifications, only: %i[index]

  get '/profile', to: 'pages#profile', as: :profile
end
