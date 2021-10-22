Rails.application.routes.draw do
  devise_for :users
  resources :friends

  get 'friendship/friend_requests', to: 'friendships#friend_requests'
  get 'accept_friend_request', to: 'friendships#accept_friend_request', as: :accept_friend_request
  get 'friendship/show', to: 'friendships#show'

  root 'home#index'
  get 'home/about'
  resources :users, only: [] do
    collection do
      get :security_settings
      post :update_password
      get :show_friends

      get :user_show
      post :user_update

      get :show_friend
    end
    member do

    end
  end
end
