Rails.application.routes.draw do
  devise_for :users
  root 'reservations#index'
  resources :reservations do
    resources :participants, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
