Rails.application.routes.draw do
  get 'main/index'
  get 'explanations/index'
  get 'reservations/search'
  root 'main#index'
  devise_for :users
  resources :reservations do
    resources :participants, only: :create
    resources :comments, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
