Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: [:index, :show]

  root 'profiles#index'
end
