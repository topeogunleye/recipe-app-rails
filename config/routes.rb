Rails.application.routes.draw do
  resources :recipes
  get '/general_shopping_list', to: "recipes#general_shopping_list"
  get '/public_recipes', to: "recipes#public_recipes"
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # root "foods#index"
  resources :inventories, only: [:index, :show, :new, :create, :destroy]
  resources :foods, only: [:new, :create, :index, :show, :destroy]
end
