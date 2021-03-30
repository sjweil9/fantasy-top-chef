Rails.application.routes.draw do
  root to: 'leagues#index', as: 'home'

  post '/users', to: 'users#create', as: 'register'
  post '/sessions', to: 'sessions#create', as: 'login'

  resources :leagues, only: %i[index show create] do
    resources :teams, only: %i[show]
  end

  devise_for :users

  # put this after devise because of /users/sign_in
  get '/users/:user_id', to: 'users#show', as: 'user_profile'
end
