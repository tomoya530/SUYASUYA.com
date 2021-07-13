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

  namespace :manager do
    resources :genres
  end

end
