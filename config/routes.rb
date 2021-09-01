Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except: [:destroy]
  resources :pets do
    resources :bookings, only: [:new, :create, :index]
  end
  resources :bookings, only: [:show, :edit, :update, :destroy]
  root to: "pages#home"
end
