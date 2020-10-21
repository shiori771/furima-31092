Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    member do
      get "index", to: "purchases#index"  
      post "create", to: "purchases#create"
    end
  end
end
