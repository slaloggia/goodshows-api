Rails.application.routes.draw do
  resources :notifications
  root 'welcome#index'
  resources :shows, only: [:index, :show]
  resources :reviews
  resources :comments, only: [:create, :index]
  resources :user_shows
  resources :users, only: [:index, :show, :update, :create] do 
    get :avatar, on: :member
  end

  namespace :api do
    namespace :v1 do
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
