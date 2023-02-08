Rails.application.routes.draw do
  devise_for :users
  resources :foods, :inventories, only: [:index, :show, :destroy]
end
