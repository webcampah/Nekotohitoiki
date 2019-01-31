Rails.application.routes.draw do
  devise_for :users
  get '/users', to: redirect("/users/sign_up")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    '/admins/sign_in',  to: 'admins/sessions#new',     as: 'new_admin_session'
  post   '/admins/sign_in',  to: 'admins/sessions#create',  as: 'admin_session'
  delete '/admins/sign_out', to: 'admins/sessions#destroy', as: 'destroy_admin_session'

  root 'tops#top'
  resources :users do
  	get 'favs', to: 'favorites#index'
  end
  resources :shops do
  	resource :favorites, only: [:create, :destroy]
  	resource :comments, only: [:create]
  end
end
