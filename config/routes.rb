Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # root "foods#index"
  resources :inventories, only: [:index, :show, :destroy]
end
