Rails.application.routes.draw do
  # root 'users#index'
  # devise_for :users, :path_prefix => 'my'
  # resources :users
  root 'users#index'
  devise_for :users, controllers: {registrations: 'users/registrations'}, :path_prefix => 'my'
  resources :users
  resources :sclasses

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
