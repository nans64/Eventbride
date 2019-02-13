Rails.application.routes.draw do
  root 'events#index'
  resources :attendances

  devise_for :users
  resources :events
  resources :users, only: [:index, :show, :edit, :update, :destroy]
end
