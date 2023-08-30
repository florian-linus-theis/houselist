# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :flats do
    resources :belongings, only: %i[create show edit update destroy] do
      resources :todos, only: %i[create update destroy]
    end
  end

  resources :notifications, only: %i[index]

  get '/profile', to: 'pages#profile', as: :profile
end
