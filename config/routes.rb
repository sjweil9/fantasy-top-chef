Rails.application.routes.draw do
  root to: 'homepage#index', as: 'home'

  scope "/fantasy-top-chef" do
    post '/users', to: 'users#create', as: 'register'
    post '/sessions', to: 'sessions#create', as: 'login'

    get '/team_leaderboard', to: 'leagues#team_leaderboard', as: 'team_leaderboard'
    get '/chef_leaderboard', to: 'leagues#chef_leaderboard', as: 'chef_leaderboard'
    get '/weekly_breakdown', to: 'leagues#weekly_breakdown', as: 'weekly_breakdown'

    resources :seasons, only: %i[show] do
      resources :episodes, only: %i[edit update]
    end

    devise_for :users

    # put this after devise because of /users/sign_in
    get '/users/:user_id', to: 'users#show', as: 'user_profile'
  end
end
