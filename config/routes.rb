Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'static_pages#home'

  get 'users/:id' => 'users#show', as: :user_profile
  get 'users/:id/pic' => 'users#new', as: :user_avatar
  post 'users/:id/pic' => 'users#create'
  # delete '/listings/:id/proposals/' => 'proposals#destroy', as: :proposals_delete

  resources :guests, only: [:index, :show]
  resources :listings do
    resources :proposals, only: [:update, :destroy]
  end

  resources :users do
  resources :messages, only: [:create, :index]
  end

  resources :notifications, only: [:update, :index, :destroy]

  resource :proposals
  resource :map, only: [:show]
  resources :jobs, only: [:show, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
