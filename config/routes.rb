Rails.application.routes.draw do
  resources :shows
  resources :reviews
  resources :user_shows
  resources :users

  namespace :api do
    namespace :v1 do
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
