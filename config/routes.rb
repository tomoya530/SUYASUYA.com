Rails.application.routes.draw do
  # devise_for :admins, controllers: {
  # sessions:      'admin/sessions',
  # passwords:     'admin/passwords',
  # registrations: 'admin/registrations'
  # }

  # devise_for :users, controllers: {
  # sessions:      'public/sessions',
  # passwords:     'public/passwords',
  # registrations: 'public/registrations'
  # }

  devise_for :admins
  devise_for :users
  root to: 'homes#top'
  get "about" => "homes#about"

  resources :items do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  end

  namespace :manager do
    resources :genres
  end

end
