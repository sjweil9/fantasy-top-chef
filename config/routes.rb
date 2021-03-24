Rails.application.routes.draw do
  devise_for :users

  root to: "leagues#index"

  post '/users', to: 'users#create', as: 'register'
end
