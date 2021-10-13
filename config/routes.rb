Rails.application.routes.draw do
  devise_for :users
  resources :friends
  # get 'home/index'
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
