Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :books do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index]

  # Add a route for the home page
  get 'home', to: 'home#index', as: 'home'
<<<<<<< HEAD
  get '/bookings/:id/accept', to: 'bookings#approve_booking', as: 'accept'
  get '/bookings/:id/decline', to: 'bookings#decline_booking', as: 'decline'

=======
>>>>>>> ac5e4b24a5b1c4454bc5a09e7e0f0d15180a2948

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
