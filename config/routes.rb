Rails.application.routes.draw do
  root "users#index"
  resources :user, only: [:index, :show] do
  resources :post, only: [:index, :show]
  end
end
