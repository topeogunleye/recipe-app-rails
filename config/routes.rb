Rails.application.routes.draw do
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :edit, :destroy]
  end

  root to: 'recipes#public_recipes'
  get 'shopping_list/:id', to: 'recipes#shopping_list'
  get 'ingredients/new', to: 'recipes#new_ingredient'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :inventories, only: [:index, :show, :new, :create, :destroy] do
    resources :inventory_foods, only: [:new, :create]
  end
  resources :foods, only: [:new, :create, :index, :show, :destroy]
end
    