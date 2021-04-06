Rails.application.routes.draw do
  root to: 'leagues#index', as: 'home'

  post '/users', to: 'users#create', as: 'register'
  post '/sessions', to: 'sessions#create', as: 'login'

  get '/chef_leaderboard', to: 'leagues#chef_leaderboard', as: 'chef_leaderboard'
  get '/weekly_breakdown', to: 'leagues#weekly_breakdown', as: 'weekly_breakdown'

  devise_for :users

  # put this after devise because of /users/sign_in
  get '/users/:user_id', to: 'users#show', as: 'user_profile'
end
