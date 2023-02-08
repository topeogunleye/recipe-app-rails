Rails.application.routes.draw do
  resources :recipes
  
  get '/public_recipes', to: 'recipes#public_recipes'
  get '/shopping_list/:id', to: 'recipes#shopping_list'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :inventories, only: [:index, :show, :destroy]
end
