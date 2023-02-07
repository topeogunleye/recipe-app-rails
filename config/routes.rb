Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "foods#index"
  devise_for :users
  resources :users
  resources :recipes
  

  # root to: 'recipes#public_recipes'
  get '/foods', to: 'food#index'
  get '/add_food', to: 'food#add'
  get '/public_recipes', to: 'recipes#public_recipes'
  post '/create_food', to: 'food#create'
  delete '/delete_food/:id', to: 'food#delete'

  get '/shopping_list/:id', to: 'recipes#shopping_list'
end
