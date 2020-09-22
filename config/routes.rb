Rails.application.routes.draw do
  get 'baskets/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#welcome'
  get 'about', to: 'pages#about'
  resources :artworks do
    resources :basket_items, only: :create
  end
  resources :basket_items, only: :destroy
  resources :contacts, only: [:new, :create]
  resources :baskets, only: :show
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
