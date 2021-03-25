Rails.application.routes.draw do
  root to: "leagues#index"

  post '/users', to: 'users#create', as: 'register'
  post '/sessions', to: 'sessions#create', as: 'login'

  devise_for :users

  # put this after devise because of /users/sign_in
  get '/users/:user_id', to: 'users#show', as: 'user_profile'
end
