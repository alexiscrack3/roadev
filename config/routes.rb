Rails.application.routes.draw do
  root 'home#index'
  get '/dashboard', to: 'dashboard#index'
  get '/users/sign_up', to: 'sessions#sign_up'
  get '/users/sign_in', to: 'sessions#sign_in'
  post '/users/sign_in', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
