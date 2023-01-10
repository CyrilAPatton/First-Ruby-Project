Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")




  get '/' => 'users#index'
  post '/sessions' => 'sessions#create'
  post '/users' => 'users#create'
  get '/posts' => 'posts#index', as: "home"

  # root "posts#index", as: "home"
  # get "about" => "pages#about", as: "about"

  resources :posts
end
