Rails.application.routes.draw do
  root 'events#index'
  #resources :attendances
  devise_for :users
  resources :events
  resources :charges
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  # Testing
  resources :events do
    resources :attendances
    resources :participations, only: [:index]
  end
end

