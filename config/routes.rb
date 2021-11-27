Rails.application.routes.draw do
  root "home#index"
  get "/dashboard", to: "dashboard#index"
  scope "/users" do
    get "/sign_up", to: "sessions#sign_up"
    post "/sign_up", to: "sessions#create_user"
    get "/sign_in", to: "sessions#sign_in"
    post "/sign_in", to: "sessions#authenticate_user"
    delete "/sign_out", to: "sessions#sign_out"
  end
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
