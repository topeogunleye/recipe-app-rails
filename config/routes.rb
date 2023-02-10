Rails.application.routes.draw do
  resources :recipes
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # root "foods#index"
  resources :inventories, only: [:index, :show, :new, :create, :destroy] do
    resources :inventory_foods, only: [:new, :create, :destroy]
  end
  resources :foods, only: [:new, :create, :index, :show, :destroy]
end
