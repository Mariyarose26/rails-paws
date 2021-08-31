Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except: [:destroy]
  resources :pets do
    resources :bookings
  end
  root to: "pages#home"
end
