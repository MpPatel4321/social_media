Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/admin/sidekiq'
  # get 'posts/index'
  devise_for :users
  root to: 'deshboard#index'
  resources "deshboard"
  resources "users"
  resources "friendships"
  get 'friend_requests', to: 'friendships#friend_request'
  resources "posts"
  resources "likes"
  resources "messages"
  resources "comments"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
