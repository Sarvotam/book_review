Rails.application.routes.draw do


  get 'seats/create'

  get 'seats/new'

  devise_for :users
  	resources :profiles
    resources :admin, only: [:index, :update,:destroy]

  resources :books do
  	resources :reviews
  end
   resources :seats
  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
