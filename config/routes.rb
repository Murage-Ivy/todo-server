Rails.application.routes.draw do
  resources :todos, only: [:index, :show, :create, :destroy, :update]
  resources :users, only: [:create] do
    resources :todos, only: [:index]
  end

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/logged_in", to: "users#show"
end
