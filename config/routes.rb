Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  # Creation des routes de user
  devise_for :users
  # Creation des routes des pages #home et #dashboard
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  # Creation des routes Booking et petsitters
  resources :petsitters do
    resources :bookings
  end


end
