Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    member do
      get "index", to: "purchase#index"  
      post "create", to: "purchase#create"
    end
  end
end
