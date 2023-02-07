Rails.application.routes.draw do
  # devise_for :users

  devise_for :users
  resources :users
  resources :recipes
  
  get '/public_recipes', to: 'recipes#public_recipes'
  get '/shopping_list/:id', to: 'recipes#shopping_list'
  resources :inventories, only: [:index, :show, :destroy]
end
