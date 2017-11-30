Rails.application.routes.draw do
  get 'reviews/index'

  get 'reviews/new'

  get 'reviews/create'

  mount Attachinary::Engine => '/attachinary'

  # Creation des routes de user
  devise_for :users
  # Creation des routes des pages #home et #dashboard
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  # Creation des routes Booking et petsitters
  resources :petsitters do
    resources :bookings do
      resources :reviews
    end
  end
end
