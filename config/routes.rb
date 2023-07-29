Rails.application.routes.draw do
  devise_for :users
  root "users#index"
   resources :users, only: [:index, :show] do
     resources :posts, only: [:index, :show, :new, :create] do
       resources :comments, only: [:new, :create]
       resources :likes, only: [:new, :create]
     end
   end
 
    namespace :api, defaults: { format: :json } do
     namespace :v1 do
       resources :users, only: [] do
         resources :posts, only: [:index]
       end
 
       resources :posts, only: [] do
         resources :comments, only: [:index, :create]
       end
     end
   end
 end
