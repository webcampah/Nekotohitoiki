Rails.application.routes.draw do
  devise_for :admins, skip: [:passwords], controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users, skip: [:passwords], controllers: {
    sessions:      'devise/sessions',
    registrations: 'devise/registrations'
  }
  get 'admins/user_index', to: 'admins#user_index'
  get 'admins/shop_index', to: 'admins#shop_index'
  get '/users', to: redirect("/")
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
