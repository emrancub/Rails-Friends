Rails.application.routes.draw do
  devise_for :users
  resources :friends
  # get 'friend/friend_request/:id', to: 'friends#friend_request'
  # get 'home/index'

  get 'friendship/friend_requests', to: 'friendships#friend_requests'

  # post 'friendship/friend_show', to: 'friendships#friend_show'
  # get 'friendship/incoming_friend_requests', to: 'friendships#incoming_friend_requests'

  root 'home#index'
  get 'home/about'
  resources :users, only: [] do
    collection do
      get :security_settings
      post :update_password
      get :show_friends

      get :user_show
      post :user_update
    end
  end

  # get 'home/security'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
