Rails.application.routes.draw do
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # root "foods#index"
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :edit, :destroy]
  end
  resources :inventories, only: [:index, :show, :new, :create, :destroy] do
    resources :inventory_foods, only: [:new, :create, :destroy]
  end
  resources :foods, only: [:new, :create, :index, :show, :destroy]
end