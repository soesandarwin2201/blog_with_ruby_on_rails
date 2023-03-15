Rails.application.routes.draw do
  devise_for :users
  get 'like/new'
  root 'user#index'
  resources :user, only: [:index, :show] do 
    resources :posts, only: [:index, :new, :create, :show] do 
      resources :comments, only: [:new, :create] 
      resources :like, only: [:create]
    end
  end
end


