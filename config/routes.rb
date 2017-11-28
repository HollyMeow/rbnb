Rails.application.routes.draw do
  # get 'petsitters/index'

  # get 'petsitters/show'

  # get 'petsitters/new'

  # get 'petsitters/createedit'

  # get 'petsitters/update'

  # get 'petsitters/destroy'

  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :petsitters

end
