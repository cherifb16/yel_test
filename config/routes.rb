Rails.application.routes.draw do
  resources :reservations
  resources :comments
  devise_for :partners
  devise_for :admins
  resources :properties
  devise_for :users
  resources :users
  resources :admins
  resources :favorites, only: [:create, :destroy, :index]
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  devise_scope :admin do
    post 'admins/guest_admin_sign_in', to: 'admins/sessions#guest_admin_sign_in'
  end
  devise_scope :partner do
    post 'partners/guest_partner_sign_in', to: 'partners/sessions#guest_partner_sign_in'
  end
  # root "home#index"
  get 'home/index'
  get 'partners/index'
  root "home#welcome"
end
