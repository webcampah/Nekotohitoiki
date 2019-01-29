Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#top'
  resources :users do
  	get 'favs', to: 'favorites#index'
  end
  resources :shops do
  	resource :favorites, only: [:create, :destroy]
  	resource :comments, only: [:create]
  end
end
