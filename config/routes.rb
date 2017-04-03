Rails.application.routes.draw do


  devise_for :users
  	resources :profiles
    resources :admin, only: [:index, :update,:destroy]

  resources :books do
  	resources :reviews
  end
  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
