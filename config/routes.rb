Rails.application.routes.draw do

  post "posts/search" => "posts#index"
  get "posts/search" => "posts#index"
  devise_for :users,  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, :only => [:index, :show, :destroy, :edit, :update ]
  get "users/:id/likes" => "users#likes"
  # get 'users/:id' => 'users#show'
  root to: "tops#index"
  resources :posts, :only=>[:index, :new, :show, :create, :edit]do
  resources :comments, only: [:new, :create]
  resources :likes, only: [:create, :destroy]
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
