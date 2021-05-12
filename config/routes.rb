Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
   }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  get 'main/index'
  get 'explanations/index'
  get 'reservations/search'
  root 'main#index'
  #devise_for :users
  resources :reservations do
    resources :participants, only: :create
    resources :comments, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
