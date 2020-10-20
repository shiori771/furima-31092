Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    member do
      get "order", to: "items#order"  
    end
  end
end
