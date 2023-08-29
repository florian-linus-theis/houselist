# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :flats, except: %i[new edit] do
    resources :belongings, only: %i[create]
    resources :todos, only: [:show, :create, :destroy]
  end

  resources :belongings, only: [:show, :update, :destroy]

  resources :notifications, only: [:show, :index, :create]

  get '/profile', to: 'pages#profile', as: :profile
end
