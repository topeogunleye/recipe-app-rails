Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # root "foods#index"
  resources :inventories, only: [:index, :show, :destroy]
end
