Rails.application.routes.draw do
  namespace :admin do
    resources :learning_paths
  end
  root "home#index"
  get "/dashboard", to: "dashboard#index"
  scope "/users" do
    get "/sign_up", to: "sessions#sign_up"
    post "/sign_up", to: "sessions#create_user"
    get "/sign_in", to: "sessions#sign_in"
    post "/sign_in", to: "sessions#authenticate_user"
    delete "/sign_out", to: "sessions#sign_out"
  end
  resources :users, only: [:index, :show, :update]
  resources :account_activations, only: [:edit]
  resources :learning_paths, only: [:show]
  resources :password_resets, only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
