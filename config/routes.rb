Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'favorites/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#top'
  resources :users, only: [:show, :edit, :update]
  resources :shops
end
