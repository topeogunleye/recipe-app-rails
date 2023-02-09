Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # root "foods#index"
  resources :inventories, only: [:index, :show, :new, :create, :destroy]
  resources :foods, only: [:new, :create, :index, :show, :destroy]
end
