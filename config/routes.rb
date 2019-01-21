Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#top'
  resources :users do
  	get ':id/favs', to: 'favorites#index'
  end
  resources :places do
  	post   'fav', to: 'favorites#create',  as: 'fav_create'
  	delete 'fav', to: 'favorites#destroy', as: 'fav_destroy'
  	resources :comments
  end
end
