Rails.application.routes.draw do
  resources :comments
  resources :rooms
  # resources :rooms, only: [:comments, :index, :show, :create, :patch, :destroy]
  resources :users

  get "`/rooms/:room_id/comments`", to: 'comments#index'
  post "/login", to: "sessions#login"
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show' 

  get '/auth', to: 'sessions#auth'
  delete '/logout', to: 'sessions#logout'

  patch "/rooms/:id/sold", to: "rooms#sold"
  get '/purchased_rooms', to: "rooms#purchased_rooms"



  # post "/posts", to: 'posts#create'
  # get "/posts", to: "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
