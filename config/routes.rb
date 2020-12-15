Rails.application.routes.draw do
  get 'baskets/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#welcome'
  get 'about', to: 'pages#about'
  get 'legal', to: 'pages#legal'
  get 'sales-conditions', to: 'pages#sales_conditions'
  get 'privacy-policy', to: 'pages#privacy_policy'
  resources :artworks do
    resources :basket_items, only: :create
  end
  resources :basket_items, only: :destroy
  resources :contacts, only: [:new, :create]
  resources :baskets, only: :show
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  get '/404', to: "errors#not_found"
  get '/422', to: "errors#unacceptable"
  get '/500', to: "errors#server_errors"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
