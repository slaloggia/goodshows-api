Rails.application.routes.draw do
  resources :shows
  resources :reviews
  resources :user_shows
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
