Rails.application.routes.draw do
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :edit, :destroy]
  end

  root to: 'recipes#public_recipes'
  get 'shopping_list/:id', to: 'recipes#shopping_list'
  get 'ingredients/new', to: 'recipes#new_ingredient'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # root "foods#index"
  resources :inventories, only: [:index, :show, :destroy]

end
    