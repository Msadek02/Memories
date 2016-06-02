Rails.application.routes.draw do
  get 'messages/index'

  get 'messages/show'

  get 'messages/new'

  get 'messages/edit'

  get 'messages/creat'

  get 'messages/destroy'

  get 'messages/update'

  resources :friendships do 
    resources :profiles
  end

  devise_for :users
  resources :profiles

  root 'profiles#index'
end
