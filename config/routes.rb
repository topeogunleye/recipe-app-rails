Rails.application.routes.draw do
  get '/public_recipes', to:"public_recipes#index"
  resources :recipes
  get '/general_shopping_list', to: "recipes#general_shopping_list"
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root "public_recipes#index"
  resources :recipes, only: [:index, :show, :new, :create] do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :inventories, only: [:index, :show, :new, :create, :destroy] do
    resources :inventory_foods, only: [:new, :create, :destroy]
  end
  resources :foods, only: [:new, :create, :index, :show, :destroy]
  get '/shopping_list', to: 'shopping_list#index', as: :shopping_list, recipe_id: /[0-9]+/, inventory_id: /[0-9]+/
end
