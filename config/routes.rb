Rails.application.routes.draw do
  # devise_for :users

  # root "foods#index"
  resources :inventories, only: [:index, :show, :destroy]
end
